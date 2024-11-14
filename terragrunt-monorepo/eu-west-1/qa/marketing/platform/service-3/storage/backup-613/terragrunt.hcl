include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/trace-collection-439",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/security/secrets-458",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/backup-620",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-613?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-613"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}