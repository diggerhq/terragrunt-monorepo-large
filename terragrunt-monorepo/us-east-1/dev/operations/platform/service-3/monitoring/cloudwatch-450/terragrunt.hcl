include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/compute/eks-532",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/security/guardduty-555",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/eks-734",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/service-mesh-328",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-450?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-450"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}