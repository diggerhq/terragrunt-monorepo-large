include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/compute/ec2-90",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-475",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/grafana-385",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-690?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-690"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}