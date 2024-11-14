include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/monitoring/trace-collection-642",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/security/certificates-495",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/compute/spot-fleet-209",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/network/direct-connect-649",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/security/shield-589",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-280?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-280"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}