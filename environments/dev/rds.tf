resource "aws_db_subnet_group" "main" {
  name = "${var.environment}-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_db_a.id,
    aws_subnet.private_db_b.id
  ]

  tags = {
    Name = "dev-db-subnet-group"
  }
}

# MySQL RDS
resource "aws_db_instance" "mysql" {

  identifier = "${var.environment}-mysql"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  db_name = "fittrack"

  username = "admin"

  password = "Password123!"

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  db_subnet_group_name = aws_db_subnet_group.main.name

  deletion_protection = false

  multi_az = false

  tags = {
    Name = "${var.environment}-mysql"
  }
}
