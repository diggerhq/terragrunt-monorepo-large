include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/storage/rds-401",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/network/route-table-276",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/eks-653",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/compute/ec2-531",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-36?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-36"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}