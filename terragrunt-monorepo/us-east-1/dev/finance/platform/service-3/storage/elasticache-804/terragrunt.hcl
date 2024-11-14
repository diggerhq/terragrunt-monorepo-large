include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/backup-787",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/ec2-214",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/eks-556",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/network/direct-connect-484",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/monitoring/cloudwatch-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-804?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-804"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}