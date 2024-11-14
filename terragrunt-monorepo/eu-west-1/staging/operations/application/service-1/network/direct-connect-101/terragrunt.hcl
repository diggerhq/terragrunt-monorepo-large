include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/kms-807",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/compute/lambda-576",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/compute/ecs-926",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/fsx-902",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-28",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-101?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-101"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}