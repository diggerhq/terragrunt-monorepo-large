include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/log-aggregation-727",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/ecs-883",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/storage/efs-961",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/compute/batch-320",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/compute/fargate-566",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-163?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-163"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}