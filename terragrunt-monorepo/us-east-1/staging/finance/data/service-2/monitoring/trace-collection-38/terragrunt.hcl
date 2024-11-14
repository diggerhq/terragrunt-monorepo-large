include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/storage/fsx-570",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/load-balancer-589",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/certificates-842",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/queue-396",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-38?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-38"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}