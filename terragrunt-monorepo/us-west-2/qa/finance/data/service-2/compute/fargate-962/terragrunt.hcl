include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/backup-204",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/application/queue-206",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/prometheus-937",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/network/endpoint-677",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-962?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-962"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}