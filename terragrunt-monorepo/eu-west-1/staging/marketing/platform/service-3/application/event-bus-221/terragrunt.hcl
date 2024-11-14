include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/compute/fargate-56",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/compute/lambda-841",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/network/route-table-276",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/security/guardduty-424",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/direct-connect-27",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-221?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-221"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}