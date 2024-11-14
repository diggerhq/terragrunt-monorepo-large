include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-1/compute/eks-442",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/compute/ec2-373",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/ecs-183",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/trace-collection-997",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/security/iam-987",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-624?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-624"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}