include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/compute/ec2-851",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/storage/efs-927",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/auto-scaling-496",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/redshift-499",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-228",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-634?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-634"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}