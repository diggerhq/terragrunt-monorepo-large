include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/network/vpc-103",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/compute/ec2-930",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/security/secrets-782",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/application/service-mesh-232",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-305?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-305"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}