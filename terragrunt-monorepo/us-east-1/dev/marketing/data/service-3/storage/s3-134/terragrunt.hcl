include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/monitoring/prometheus-533",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/kms-236",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/network/vpc-211",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-216",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/compute/batch-391",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-134?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-134"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}