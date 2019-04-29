resource "aws_instance" "example" {
  ami                    = "ami-0f9ae750e8274075b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.example_ec2.id}"]
  tags = {
    Name = "example"
  }

  user_data = data.template_file.httpd_user_data.rendered

}

output "example_public_dns" {
  value = aws_instance.example.public_dns
}

