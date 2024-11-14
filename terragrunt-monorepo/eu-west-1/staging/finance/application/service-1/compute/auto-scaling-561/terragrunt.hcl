include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/compute/auto-scaling-800",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/security/kms-221",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/storage/s3-478",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/queue-7",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-561?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-561"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}