include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/storage/s3-18",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/security/certificates-745",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/load-balancer-942",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpn-946",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-209?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-209"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}