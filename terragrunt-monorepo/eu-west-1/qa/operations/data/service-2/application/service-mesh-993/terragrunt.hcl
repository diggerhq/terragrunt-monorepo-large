include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/compute/eks-450",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/storage/backup-986",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/redshift-319",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/certificates-706",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/network/endpoint-401",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-993?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-993"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}