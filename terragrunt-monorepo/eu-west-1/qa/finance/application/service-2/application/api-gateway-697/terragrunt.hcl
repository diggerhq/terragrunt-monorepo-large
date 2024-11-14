include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-2/storage/rds-611",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/backup-172",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/storage/efs-567",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/monitoring/cloudwatch-741",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/log-aggregation-436",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-697?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-697"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}