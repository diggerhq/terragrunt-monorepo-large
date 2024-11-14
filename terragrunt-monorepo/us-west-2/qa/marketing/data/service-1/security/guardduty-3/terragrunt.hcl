include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/security/security-hub-160",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/application/queue-679",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-3?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-3"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}