include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/network/nacl-474",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/compute/eks-407",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/storage/dynamodb-303",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/backup-172",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/cloudwatch-854",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-422?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-422"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}