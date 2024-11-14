include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/monitoring/cloudwatch-438",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/batch-995",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/application/api-gateway-751",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/security/security-hub-396",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-457?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-457"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}