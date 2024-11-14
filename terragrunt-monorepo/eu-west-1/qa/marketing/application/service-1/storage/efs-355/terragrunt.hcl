include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/monitoring/trace-collection-402",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/compute/auto-scaling-806",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/application/event-bus-786",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/storage/fsx-846",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/s3-823",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-355?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-355"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}