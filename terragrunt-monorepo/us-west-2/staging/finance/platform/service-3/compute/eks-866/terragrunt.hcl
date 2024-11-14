include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/elasticache-359",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/network/direct-connect-238",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/compute/lambda-46",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/security-hub-274",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-866?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-866"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}