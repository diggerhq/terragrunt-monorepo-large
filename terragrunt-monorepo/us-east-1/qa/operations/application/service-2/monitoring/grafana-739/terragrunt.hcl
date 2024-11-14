include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/application/load-balancer-841",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/dynamodb-373",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/network/nacl-762",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/security/kms-427",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpn-946",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-739?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-739"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}