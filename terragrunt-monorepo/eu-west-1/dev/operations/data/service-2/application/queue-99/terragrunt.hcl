include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/monitoring/trace-collection-340",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/security-hub-728",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/application/queue-533",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/queue-227",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-99?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-99"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}