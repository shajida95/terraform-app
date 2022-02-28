resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv6hpbnxg6X6/zgtGKHiw/EKytqUBp9peubdn3xtVX6pq0zD8yYf+5S2Lwruyby9n8OU90Y9SDW1Ge+s1iA0vrl0MLSquSH4sUtuX6OKeQkDDm7G5TtRaFHpY20sdXb2nNhFKAD80ERcI8Xl/6OvU+QI0siGqY/qLWMks9mlKYwU75+clcZq0oq2vuMJt0cGOKmnYpt2hiCgkTXXzTeXJFvDXuca1v7xy4utR6gy4r20mEx9GLE8gZtVmnnk89xJsnMRKwVI3XhXP6enETmX7sgo7FTMUXS/DggGcTBWlHNJlybsdKP8nsrZc38pfdCoo0H/2i3Zm32Ld6Yne1CXx0v4tk5t/qFhmPbQ//69eLFx/9XJMue3Dv75b3UtwDIsyby2XcS6bbXdVXMQVrycjE4bXMMyvnF3t2Z/ZRjdEjq4TVODwsVLhTEb1vx6nuEpN9j4zxZxcig5sZkJ9Ju9Pk88Tjk2ZllUEnzt7GozN0chuZ/PVIbI3OCG5LNJUrzcU= shajida.akthar@DEM-C02XL2SFJGH6"
}

resource "aws_instance" "web" {
ami = "ami-0dd555eb7eb3b7c82"
instance_type = "t2.micro"
key_name = "deployer-key"
monitoring = true
vpc_security_group_ids = ["${aws_security_group.sg.id}"]
subnet_id = "${aws_subnet.private_subnet.id}"
private_ip = "10.0.1.11"
associate_public_ip_address = false 
tags = {
Name = "web"
}
}

resource "aws_instance" "nginx" {
ami = "ami-0dd555eb7eb3b7c82"
instance_type = "t2.micro"
key_name = "deployer-key"
monitoring = true
vpc_security_group_ids = ["${aws_security_group.sg.id}"]
subnet_id = "${aws_subnet.public_subnet.id}"
associate_public_ip_address = true 
tags = {
Name = "nginx"
}
}