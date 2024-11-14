include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/security/certificates-181",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/compute/eks-407",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/iam-600",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/storage/dynamodb-213",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/compute/auto-scaling-323",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-840?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-840"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}