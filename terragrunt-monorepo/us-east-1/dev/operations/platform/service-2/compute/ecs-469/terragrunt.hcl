include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/storage/s3-18",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/network/endpoint-780",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/service-mesh-814",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/storage/backup-908",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/compute/fargate-516",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-469?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-469"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}