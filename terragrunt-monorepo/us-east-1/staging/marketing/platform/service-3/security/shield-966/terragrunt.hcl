include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/compute/spot-fleet-102",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/route-table-742",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/guardduty-5",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/fargate-4",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/compute/eks-883",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-966?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-966"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}