include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-2/compute/lambda-434",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/transit-gateway-321",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/storage/elasticache-480",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-691?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-691"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}