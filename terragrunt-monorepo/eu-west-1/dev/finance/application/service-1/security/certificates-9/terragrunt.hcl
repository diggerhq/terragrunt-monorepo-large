include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/compute/auto-scaling-351",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/compute/fargate-87",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-410",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-9?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-9"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}