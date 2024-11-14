include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/storage/efs-632",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/monitoring/log-aggregation-836",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/compute/batch-718",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/queue-823",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/storage/backup-846",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-489?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-489"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}