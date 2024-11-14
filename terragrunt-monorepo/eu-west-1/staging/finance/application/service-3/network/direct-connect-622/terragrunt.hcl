include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/queue-227",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/storage/fsx-18",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/direct-connect-763",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/application/load-balancer-690",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/service-mesh-505",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-622?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-622"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}