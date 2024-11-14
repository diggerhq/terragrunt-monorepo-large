include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/compute/ec2-135",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/storage/fsx-590",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/application/load-balancer-829",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/compute/spot-fleet-364",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/security/secrets-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-7?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-7"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}