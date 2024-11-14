include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/ec2-797",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/application/load-balancer-866",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/monitoring/grafana-207",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/compute/batch-802",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/guardduty-583",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-334?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-334"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}