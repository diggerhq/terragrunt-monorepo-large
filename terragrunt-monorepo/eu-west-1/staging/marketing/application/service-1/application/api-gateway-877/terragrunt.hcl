include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-3/compute/lambda-827",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/storage/backup-177",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/ec2-443",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/ecs-69",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/direct-connect-173",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-877?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-877"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}