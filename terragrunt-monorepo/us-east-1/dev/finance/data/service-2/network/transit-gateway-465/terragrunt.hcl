include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/storage/redshift-70",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/secrets-140",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/network/vpc-243",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/application/load-balancer-387",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-465?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-465"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}