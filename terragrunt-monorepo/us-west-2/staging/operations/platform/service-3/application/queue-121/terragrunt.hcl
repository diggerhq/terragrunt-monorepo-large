include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/network/endpoint-606",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/trace-collection-566",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/service-mesh-211",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/monitoring/trace-collection-730",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-121?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-121"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}