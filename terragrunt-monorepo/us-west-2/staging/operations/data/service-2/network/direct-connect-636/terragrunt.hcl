include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/event-bus-451",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/application/cache-layer-803",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-289",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/application/queue-637",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/compute/eks-348",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-636?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-636"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}