output "ip" {
  value = aws_instance.lesson6.public_ip

}

output "dns" {
  value = aws_instance.lesson6.public_dns

}