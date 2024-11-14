include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/compute/fargate-439",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/application/queue-874",
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/monitoring/cloudwatch-450",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-571?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-571"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}