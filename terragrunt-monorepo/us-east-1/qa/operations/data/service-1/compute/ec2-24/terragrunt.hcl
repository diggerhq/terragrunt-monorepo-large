include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/storage/fsx-620",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/storage/efs-308",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/monitoring/grafana-207",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/efs-270",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/storage/dynamodb-695",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-24?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-24"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}