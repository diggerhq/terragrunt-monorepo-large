include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/compute/eks-499",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/fsx-820",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/compute/eks-561",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/lambda-135",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/security/security-hub-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-843?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-843"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}