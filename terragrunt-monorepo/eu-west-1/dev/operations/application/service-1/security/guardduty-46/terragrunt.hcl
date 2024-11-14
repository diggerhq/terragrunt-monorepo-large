include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/eks-385",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/network/endpoint-482",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/fargate-994",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/rds-975",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/lambda-157",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-46?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-46"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}