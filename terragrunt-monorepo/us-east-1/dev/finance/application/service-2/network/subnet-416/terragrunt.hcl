include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/security/guardduty-18",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-122",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-296",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-416?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-416"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}