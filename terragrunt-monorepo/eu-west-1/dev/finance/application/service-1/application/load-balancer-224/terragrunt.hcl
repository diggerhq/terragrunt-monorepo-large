include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/compute/eks-557",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/compute/ec2-782",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/efs-444",
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/batch-221",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-224?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-224"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}