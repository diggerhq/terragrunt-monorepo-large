include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/storage/dynamodb-410",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/network/subnet-108",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/certificates-948",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/service-mesh-174",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/compute/ec2-873",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-899?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-899"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}