include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/compute/fargate-944",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/cloudwatch-446",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-278",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/application/load-balancer-772",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-386?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-386"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}