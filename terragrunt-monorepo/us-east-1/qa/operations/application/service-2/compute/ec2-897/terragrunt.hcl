include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/application/queue-592",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/security/secrets-748",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/application/cache-layer-440",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-897?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-897"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}