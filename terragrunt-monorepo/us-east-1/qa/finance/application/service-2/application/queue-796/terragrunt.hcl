include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/endpoint-67",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/compute/eks-862",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/direct-connect-998",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/monitoring/trace-collection-18",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-796?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-796"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}