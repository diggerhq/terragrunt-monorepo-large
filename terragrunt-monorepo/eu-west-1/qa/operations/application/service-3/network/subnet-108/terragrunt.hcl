include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/api-gateway-697",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-174",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/application/load-balancer-992",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/load-balancer-544",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/nacl-769",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-108?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-108"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}