include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/lambda-356",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-365?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-365"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}