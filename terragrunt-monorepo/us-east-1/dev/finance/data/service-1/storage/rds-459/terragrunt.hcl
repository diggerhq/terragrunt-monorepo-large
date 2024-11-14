include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-3/security/iam-967",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/compute/ec2-638",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/security/certificates-271",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/application/queue-237",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/compute/fargate-706",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-459?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-459"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}