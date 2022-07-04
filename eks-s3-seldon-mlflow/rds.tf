module "metadata_store" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "${local.prefix}-${local.rds.rds_name}"

  engine            = local.rds.db_type
  engine_version    = local.rds.db_version
  instance_class    = "db.t3a.large"
  allocated_storage = 5

  db_name  = local.rds.db_name
  username = local.rds.username
  password = local.rds.password
  port     = "3306"


  # configure access
  publicly_accessible = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.public_subnets  

  iam_database_authentication_enabled = true

  # we've added MySQL ingress rules to 
  # this sg so we're using it here
  vpc_security_group_ids = [module.vpc.default_security_group_id]


  tags = {
    Owner       = "user"
    Environment = "zenml-env"
  }

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]
}