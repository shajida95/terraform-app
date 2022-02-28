
resource "aws_instance" "web" {
ami = "ami-0dd555eb7eb3b7c82"
instance_type = "t2.micro"
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
monitoring = true
vpc_security_group_ids = ["${aws_security_group.sg.id}"]
subnet_id = "${aws_subnet.public_subnet.id}"
associate_public_ip_address = true 
tags = {
Name = "nginx"
}
}
