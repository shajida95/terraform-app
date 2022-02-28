resource "aws_subnet" "public_subnet" {

    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2a"

    tags = {
        Name = "tampublicsubnet"
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = "public_route"
    }
}

resource "aws_route" "public_route" {
    route_table_id = "${aws_route_table.public_route_table.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_subnet" "private_subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "tamprivatesubnet"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = "private_route"
    }
}

resource "aws_route" "private_route" {
    route_table_id = "${aws_route_table.private_route_table.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

resource "aws_route_table_association" "private_subnet_association" {
    subnet_id = "${aws_subnet.private_subnet.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_subnet" "private_subnet1" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-2c"
    tags = {
        Name = "tamprivatesubnet1"
    }
}

resource "aws_route_table" "private_route_table1" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = "private_route1"
    }

}

resource "aws_route_table_association" "private_subnet_association1" {
    subnet_id = "${aws_subnet.private_subnet1.id}"
    route_table_id = "${aws_route_table.private_route_table1.id}"
}