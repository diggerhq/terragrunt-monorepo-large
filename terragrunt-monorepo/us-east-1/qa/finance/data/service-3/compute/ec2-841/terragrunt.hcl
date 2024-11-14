include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/lambda-833",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/batch-258",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/grafana-681",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/application/load-balancer-450",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-841?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-841"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}