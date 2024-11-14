include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/service-mesh-804",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/network/subnet-145",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/storage/s3-996",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/storage/s3-134",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/shield-80",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-385?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-385"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}