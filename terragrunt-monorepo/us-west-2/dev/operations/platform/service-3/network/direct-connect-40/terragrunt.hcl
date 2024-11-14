include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-63",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/network/vpc-556",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/load-balancer-590",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/compute/fargate-479",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-40?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-40"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}