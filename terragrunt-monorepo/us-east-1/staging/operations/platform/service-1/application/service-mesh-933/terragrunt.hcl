include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/storage/dynamodb-829",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/compute/fargate-136",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/application/api-gateway-754",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/compute/ecs-401",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-933?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-933"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}