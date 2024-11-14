include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/ec2-993",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/security/waf-606",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/monitoring/trace-collection-802",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/efs-270",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-309?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-309"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}