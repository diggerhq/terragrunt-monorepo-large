# Root terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.account_vars.account_id}-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region_vars.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = local.region_vars.aws_region
  
  assume_role {
    role_arn = local.account_vars.role_arn
  }
}
EOF
}

locals {
  # Load account variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl", "ignore"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl", "ignore"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl", "ignore"))

  # Extract commonly used variables
  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.account_id
  aws_region   = local.region_vars.locals.aws_region
}

inputs = {
  aws_region   = local.aws_region
  account_name = local.account_name
  account_id   = local.account_id
  
  tags = {
    ManagedBy   = "Terragrunt"
    Environment = local.env_vars.locals.environment
  }
}