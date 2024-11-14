include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/compute/batch-193",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/compute/ec2-966",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/fsx-109",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/transit-gateway-74",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-656?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-656"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}