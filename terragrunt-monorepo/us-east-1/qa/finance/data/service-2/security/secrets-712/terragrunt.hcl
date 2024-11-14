include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-398",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/application/service-mesh-192",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/event-bus-334",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/ec2-297",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}