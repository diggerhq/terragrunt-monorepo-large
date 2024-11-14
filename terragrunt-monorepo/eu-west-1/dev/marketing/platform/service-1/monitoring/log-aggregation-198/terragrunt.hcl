include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/secrets-416",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/network/direct-connect-636",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/ecs-656",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/monitoring/cloudwatch-648",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/security/security-hub-976",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-198?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-198"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}