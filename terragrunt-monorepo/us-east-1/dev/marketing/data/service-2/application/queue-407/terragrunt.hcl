include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-3/monitoring/prometheus-138",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/monitoring/cloudwatch-434",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/secrets-785",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-407?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-407"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}