#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "eks-s12n-demo" {
  cidr_block = "10.0.0.0/16"

  tags = "${
    map(
     "Name", "eks-s12n-demo",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "eks-s12n-demo-private" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.eks-s12n-demo.id}"

  tags = "${
    map(
     "Name", "eks-s12n-demo",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "eks-s12n-demo-public" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index+2}.0/24"
  vpc_id            = "${aws_vpc.eks-s12n-demo.id}"

  tags = "${
    map(
     "Name", "eks-s12n-demo",
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_eip" "eks-s12n-demo" {
  count             = 2 

  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "eks-s12n-demo" {
  vpc_id = "${aws_vpc.eks-s12n-demo.id}"

  tags {
    Name = "eks-s12n-demo"
  }
}

resource "aws_nat_gateway" "eks-s12n-demo" {
  count         = 2 

  allocation_id = "${element(aws_eip.eks-s12n-demo.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.eks-s12n-demo-public.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route_table" "eks-s12n-demo-public" {
  vpc_id = "${aws_vpc.eks-s12n-demo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.eks-s12n-demo.id}"
  }
}

resource "aws_route_table" "eks-s12n-demo-private" {
  vpc_id = "${aws_vpc.eks-s12n-demo.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.eks-s12n-demo.*.id, count.index)}"
  }

  tags {
    Name        = "nat-gateway-route-table"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route_table_association" "eks-s12n-demo-public" {
  count = 2

  subnet_id      = "${aws_subnet.eks-s12n-demo-public.*.id[count.index]}"
  route_table_id = "${aws_route_table.eks-s12n-demo-public.id}"
}


resource "aws_route_table_association" "eks-s12n-demo-private" {
  count = 2

  subnet_id      = "${aws_subnet.eks-s12n-demo-private.*.id[count.index]}"
  route_table_id = "${aws_route_table.eks-s12n-demo-private.id}"
}
