data "aws_s3_bucket" "target_bucket" {
  bucket = "terraform-state-luji1"
}

data "aws_ssm_parameter" "aws_account_id" {
  name = "/account/id"
}

module "s3" {
  source      = "https://github.com/tosinakinro/luji-terraform-modules.git//apache_airflow/s3"
  environment_names = var.environment_names
  tags = var.tags
  cloudtrial_name = var.cloudtrial_name
  s3_logging_target_bucket = data.aws_s3_bucket.target_bucket.bucket
}

module "iam" {
  source            = "https://github.com/tosinakinro/luji-terraform-modules.git//apache_airflow/iam"
  role_name         = var.iam_role_name
  role_policy_name  = var.role_policy_name
  bucket_arn        = module.s3.bucket_arns
  environment_names = var.environment_names
  account_id        = data.aws_ssm_parameter.aws_account_id.value
  region            = var.region
  tags              = var.tags
}


module "vpc" {
  source = "https://github.com/tosinakinro/luji-terraform-modules.git//apache_airflow/vpc"

  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  azs                  = var.azs
  vpc_tags             = var.vpc_tags
}


module "security_group" {
  source  = "https://github.com/tosinakinro/luji-terraform-modules.git//apache_airflow/security_group"
  vpc_id  = module.vpc.vpc_id
  sg_name = var.security_group_name
}

module "mwaa" {
  source                          = "https://github.com/tosinakinro/luji-terraform-modules.git//apache_airflow/mwaa"
  environment_names               = var.environment_names
  airflow_version                 = var.airflow_version
  dag_s3_path                     = var.dag_s3_path
  environment_class               = var.environment_class
  subnet_ids                      = module.vpc.private_subnet_id
  security_group_id               = [module.security_group.security_group_id]
  execution_role_arn              = module.iam.execution_role_arn
  source_bucket_arn               = module.s3.bucket_arns
  webserver_access_mode           = var.webserver_access_mode
  weekly_maintenance_window_start = var.weekly_maintenance_window_start
  max_workers                     = var.max_workers
  tags                            = var.tags
}

