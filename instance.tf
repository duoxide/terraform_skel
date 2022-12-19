# Instance creation

resource "aws_instance" "alex-instance" {
  # count = var.instance_count
  ami = data.aws_ami.ami_latest.id
  instance_type          = "t2.micro"
  # instance_type          = "t2.medium"
  subnet_id              = aws_subnet.main-public-1[0].id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.mykeypair.key_name
  root_block_device {
    volume_size = 30
  }
  # user_data              = file("docker-install.sh")
  tags = {
    Name = "alex-intance-${terraform.workspace}"
  }
}