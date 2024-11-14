include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/storage/efs-466",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/compute/fargate-56",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/shield-764",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/security/iam-374",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/security/security-hub-913",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-615?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-615"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}