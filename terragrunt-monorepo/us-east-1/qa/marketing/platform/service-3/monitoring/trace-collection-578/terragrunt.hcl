include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/batch-598",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/application/api-gateway-729",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/security/secrets-329",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/compute/eks-580",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-578?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-578"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}