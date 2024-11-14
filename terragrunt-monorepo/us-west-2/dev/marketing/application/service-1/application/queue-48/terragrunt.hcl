include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/storage/redshift-789",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/application/service-mesh-375",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/monitoring/cloudwatch-661",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/service-mesh-141",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/dynamodb-887",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-48?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-48"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}