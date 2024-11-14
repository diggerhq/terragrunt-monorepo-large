include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/network/route-table-972",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/compute/ec2-41",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/compute/fargate-87",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-929?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-929"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}