include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/certificates-446",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/route-table-328",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/ec2-561",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/fsx-648",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/guardduty-583",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-562?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-562"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}