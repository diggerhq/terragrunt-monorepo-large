include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/monitoring/trace-collection-596",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/network/vpc-876",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/certificates-446",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/security/certificates-854",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/compute/spot-fleet-679",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-180?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-180"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}