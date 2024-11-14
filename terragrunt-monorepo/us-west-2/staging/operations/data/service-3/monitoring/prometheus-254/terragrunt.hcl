include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/service-mesh-423",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/transit-gateway-489",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/network/subnet-649",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/ec2-690",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}