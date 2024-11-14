include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/network/subnet-186",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/monitoring/log-aggregation-133",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/network/nacl-550",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/queue-796",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/compute/batch-855",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-567?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-567"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}