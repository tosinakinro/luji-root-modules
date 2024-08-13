region                           = "us-east-1"
s3_bucket_name                   = "luji-mwaa-bucket"
iam_role_name                    = "luji-mwaa-execution-role"
vpc_cidr                         = "10.0.0.0/16"
private_subnet_cidrs             = ["10.0.3.0/24", "10.0.4.0/24"]
azs                              = ["us-east-1a", "us-east-1b"]
environment_names                = ["luji-dev-mwaa-environment"]
airflow_version                  = "2.9.2"
environment_class                = "mw1.small"
webserver_access_mode            = "PUBLIC_ONLY"
weekly_maintenance_window_start  = "TUE:03:00"
security_group_name              = "mwaa-sg"
dag_s3_path                      = "dags/"
max_workers                      = "2"
cloudtrial_name                  = "mwaa-s3-cloudtrail"
role_policy_name                 = "luji-mwaa-execution-role-policy"
tags                             = {
  product     = "kanba-board"
  Environment = "Dev"
  Team        = "Cloud Engineering"
}
vpc_tags                         = {
  name        = "mwaa-resource"
  product     = "kanba-board"
  Environment = "Dev"
  Team        = "Cloud Engineering"
}