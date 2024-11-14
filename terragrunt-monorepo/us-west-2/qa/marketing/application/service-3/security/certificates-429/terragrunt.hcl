include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-268",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/storage/elasticache-81",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/compute/fargate-962",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/network/vpn-256",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-265",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-429?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-429"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}