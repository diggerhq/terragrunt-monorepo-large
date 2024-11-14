include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/application/queue-914",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/security/guardduty-854",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/application/load-balancer-335",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/network/direct-connect-40",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-175?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-175"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}