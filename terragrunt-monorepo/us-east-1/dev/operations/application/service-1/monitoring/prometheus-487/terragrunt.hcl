include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/dynamodb-829",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/application/cache-layer-996",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/application/queue-439",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/application/service-mesh-797",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/ec2-336",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-487?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-487"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}