include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/security/security-hub-154",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/iam-284",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/security/certificates-910",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/service-mesh-211",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/storage/efs-842",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-783?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-783"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}