include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/storage/dynamodb-43",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/application/load-balancer-863",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/storage/fsx-219",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/cloudwatch-854",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/iam-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-728?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-728"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}