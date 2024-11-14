include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/certificates-196",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/auto-scaling-405",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/application/service-mesh-259",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/compute/fargate-194",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-480?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-480"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}