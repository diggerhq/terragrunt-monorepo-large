include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/network/transit-gateway-990",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/batch-827",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/network/transit-gateway-671",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/application/queue-459",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/security/certificates-910",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-58?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-58"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}