include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/batch-598",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/monitoring/log-aggregation-736",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/storage/backup-561",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/nacl-622",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/security/certificates-962",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-984?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-984"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}