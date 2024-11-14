include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/compute/ec2-259",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/security/kms-40",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/monitoring/alertmanager-560",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/storage/redshift-301",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/storage/backup-886",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-279?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-279"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}