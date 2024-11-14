include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/compute/eks-395",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/application/cache-layer-241",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/trace-collection-782",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/compute/spot-fleet-646",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-492?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-492"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}