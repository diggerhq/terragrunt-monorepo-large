include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/rds-848",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/grafana-679",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/nacl-311",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/service-mesh-750",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-491?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-491"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}