include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/compute/eks-557",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-407",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/storage/efs-213",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/storage/elasticache-69",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/api-gateway-201",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-299?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-299"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}