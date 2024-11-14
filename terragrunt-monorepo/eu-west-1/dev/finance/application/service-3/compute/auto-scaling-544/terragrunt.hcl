include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/storage/elasticache-804",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/network/subnet-975",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/monitoring/cloudwatch-76",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/compute/eks-955",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/compute/lambda-841",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-544?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-544"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}