include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/compute/ec2-873",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/storage/fsx-505",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/network/subnet-395",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/security/certificates-631",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/storage/fsx-89",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-625?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-625"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}