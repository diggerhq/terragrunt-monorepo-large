include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/security/certificates-378",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/waf-528",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/security/waf-85",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/compute/auto-scaling-800",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/ec2-443",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-398?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-398"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}