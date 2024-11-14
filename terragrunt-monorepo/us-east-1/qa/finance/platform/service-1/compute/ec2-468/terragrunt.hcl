include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/alertmanager-756",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/monitoring/cloudwatch-312",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/security/shield-707",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-468?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-468"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}