include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/trace-collection-27",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/security-hub-387",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/compute/auto-scaling-156",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/storage/rds-691",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-794",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-420?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-420"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}