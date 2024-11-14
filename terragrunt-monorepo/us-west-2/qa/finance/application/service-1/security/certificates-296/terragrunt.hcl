include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/compute/fargate-298",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/compute/eks-623",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/storage/backup-761",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/security/guardduty-581",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-296?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-296"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}