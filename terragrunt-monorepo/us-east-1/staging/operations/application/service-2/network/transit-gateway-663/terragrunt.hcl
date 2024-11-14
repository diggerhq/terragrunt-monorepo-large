include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/security/certificates-847",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/security/secrets-719",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/cloudwatch-34",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/queue-925",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-228",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-663?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-663"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}