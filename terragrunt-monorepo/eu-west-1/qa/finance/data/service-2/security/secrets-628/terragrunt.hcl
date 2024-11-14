include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/compute/ecs-679",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/network/vpc-276",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/compute/auto-scaling-492",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/ec2-420",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-628?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-628"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}