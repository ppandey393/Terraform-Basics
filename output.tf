output "my-ec2-ip" {
    value = aws_instance.my-instance.public_ip
  
}