include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/s3-624",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/elasticache-10",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/trace-collection-363",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-412?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-412"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}