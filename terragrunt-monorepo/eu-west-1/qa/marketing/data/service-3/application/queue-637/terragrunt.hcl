include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/application/service-mesh-273",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/security/guardduty-801",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/eks-734",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/load-balancer-281",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/network/subnet-105",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-637?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-637"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}