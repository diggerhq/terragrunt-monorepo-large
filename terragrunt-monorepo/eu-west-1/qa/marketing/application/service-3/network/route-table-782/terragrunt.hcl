include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/service-mesh-423",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/compute/ecs-314",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/security/certificates-407",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/storage/backup-468",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-782?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-782"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}