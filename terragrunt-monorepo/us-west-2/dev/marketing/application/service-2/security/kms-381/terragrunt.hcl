include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/network/transit-gateway-436",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/subnet-189",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-282",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/security/iam-955",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/compute/eks-561",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-381?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-381"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}