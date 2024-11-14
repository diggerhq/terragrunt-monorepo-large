include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/storage/efs-728",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-265",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/security/secrets-951",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/grafana-818",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-710?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-710"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}