include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-2/network/direct-connect-230",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/monitoring/trace-collection-480",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/compute/eks-253",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/ec2-913",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-606?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-606"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}