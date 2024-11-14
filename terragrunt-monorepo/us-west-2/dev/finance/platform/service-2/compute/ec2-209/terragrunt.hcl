include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/application/queue-586",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/certificates-876",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/monitoring/log-aggregation-898",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/elasticache-810",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/nacl-466",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-209?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-209"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}