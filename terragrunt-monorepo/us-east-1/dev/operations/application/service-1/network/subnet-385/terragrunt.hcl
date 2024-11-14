include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/ec2-786",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/application/queue-752",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/cloudwatch-602",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/auto-scaling-675",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/network/direct-connect-408",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-385?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-385"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}