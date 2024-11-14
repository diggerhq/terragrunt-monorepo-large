include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/application/queue-407",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/application/load-balancer-171",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/network/vpc-145",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/security/iam-444",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/certificates-167",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-278?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-278"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}