include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/storage/rds-901",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/cloudwatch-542",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/compute/lambda-721",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/application/queue-293",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-295?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-295"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}