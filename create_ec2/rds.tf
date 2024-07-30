resource "aws_db_instance" "default" {
  
  engine               = "mysql"
  engine_version       = "8.0.37"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  identifier           = "mydb"
  username             = "admin"
  password             = "securepassword321"
  publicly_accessible  = true
  skip_final_snapshot  = true

  tags = {
    Name = "my-rds"
  }
}
