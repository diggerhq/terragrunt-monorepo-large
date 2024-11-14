include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/backup-429",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/network/transit-gateway-506",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/compute/lambda-672",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/iam-600",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/compute/ecs-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-164?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-164"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}