include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/fsx-458",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/redshift-569",
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/fargate-814",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-655?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-655"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}