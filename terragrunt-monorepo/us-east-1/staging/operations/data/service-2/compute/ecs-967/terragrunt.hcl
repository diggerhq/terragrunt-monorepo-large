include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/transit-gateway-489",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/kms-21",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/application/load-balancer-290",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/service-mesh-782",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-967?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-967"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}