include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/compute/eks-450",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/application/api-gateway-415",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-409",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-214?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-214"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}