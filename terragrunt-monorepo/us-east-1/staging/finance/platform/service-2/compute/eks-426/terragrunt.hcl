include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/kms-21",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/monitoring/alertmanager-410",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/compute/eks-557",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-426?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-426"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}