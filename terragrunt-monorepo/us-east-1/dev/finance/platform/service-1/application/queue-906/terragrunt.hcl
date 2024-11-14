include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/trace-collection-822",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/monitoring/cloudwatch-354",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/monitoring/cloudwatch-626",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-906?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-906"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}