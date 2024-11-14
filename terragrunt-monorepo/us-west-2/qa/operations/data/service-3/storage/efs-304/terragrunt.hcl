include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/ec2-214",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/auto-scaling-385",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/guardduty-336",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/compute/ec2-443",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/application/queue-505",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-304?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-304"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}