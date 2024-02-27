resource "aws_efs_file_system" "ls_storage_efs" {

  encrypted = false

  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  protection {
    replication_overwrite = "DISABLED"
  }
}

resource "aws_efs_mount_target" "ls_storage_efs_mount_1" {
  file_system_id  = aws_efs_file_system.ls_storage_efs.id
  subnet_id       = aws_subnet.web_server_subnet_1.id
  security_groups = [aws_security_group.ls_storage_sg.id]
}

resource "aws_efs_mount_target" "ls_storage_efs_mount_2" {
  file_system_id  = aws_efs_file_system.ls_storage_efs.id
  subnet_id       = aws_subnet.web_server_subnet_2.id
  security_groups = [aws_security_group.ls_storage_sg.id]
}

resource "aws_efs_mount_target" "ls_storage_efs_mount_3" {
  file_system_id  = aws_efs_file_system.ls_storage_efs.id
  subnet_id       = aws_subnet.web_server_subnet_3.id
  security_groups = [aws_security_group.ls_storage_sg.id]
}


resource "aws_security_group" "ls_storage_sg" {
  vpc_id = aws_vpc.web_server_vpc.id
  name   = "ls-storage-sg"


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ls-storage-sg"
  }
}