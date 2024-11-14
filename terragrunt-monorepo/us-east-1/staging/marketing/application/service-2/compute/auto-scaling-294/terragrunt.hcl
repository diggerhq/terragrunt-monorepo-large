include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/application/load-balancer-772",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/network/vpn-140",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/load-balancer-896",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/application/load-balancer-431",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/network/route-table-807",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-294?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-294"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}