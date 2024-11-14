include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/network/vpn-548",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/service-mesh-505",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/security/guardduty-507",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/load-balancer-465",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/monitoring/trace-collection-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-548?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-548"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}