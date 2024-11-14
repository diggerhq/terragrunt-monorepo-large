include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/ec2-809",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/ec2-658",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/load-balancer-942",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/security/iam-955",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-181?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-181"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}