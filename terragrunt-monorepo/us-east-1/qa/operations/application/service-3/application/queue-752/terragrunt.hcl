include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-2/compute/eks-939",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/application/queue-843",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/cloudwatch-61",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/monitoring/trace-collection-461",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-752?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-752"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}