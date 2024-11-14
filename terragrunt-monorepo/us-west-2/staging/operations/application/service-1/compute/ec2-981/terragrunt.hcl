include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/application/service-mesh-795",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/queue-505",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/monitoring/grafana-975",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-981?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-981"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}