include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-2/network/route-table-572",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/monitoring/trace-collection-994",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/compute/ec2-443",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/security/iam-474",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/application/cache-layer-312",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-862?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-862"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}