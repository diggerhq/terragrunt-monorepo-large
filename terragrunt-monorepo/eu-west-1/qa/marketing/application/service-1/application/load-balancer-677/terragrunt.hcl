include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/fsx-70",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/application/load-balancer-255",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/security-hub-183",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/dynamodb-590",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-677?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-677"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}