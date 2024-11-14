include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/compute/fargate-56",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/application/queue-347",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/guardduty-94",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-658?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-658"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}