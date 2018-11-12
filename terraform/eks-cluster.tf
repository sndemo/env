#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "eks-s12n-demo-cluster" {
  name = "eks-s12n-demo-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.eks-s12n-demo-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.eks-s12n-demo-cluster.name}"
}

resource "aws_security_group" "eks-s12n-demo-cluster" {
  name        = "eks-s12n-demo-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.eks-s12n-demo.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "eks-s12n-demo-cluster"
  }
}

resource "aws_security_group_rule" "eks-s12n-demo-cluster-ingress-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.eks-s12n-demo-cluster.id}"
  source_security_group_id = "${aws_security_group.eks-s12n-demo-node.id}"
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks-s12n-demo-cluster-ingress-workstation-https" {
  cidr_blocks       = ["${local.workstation-external-cidr}"]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.eks-s12n-demo-cluster.id}"
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "eks-s12n-demo-cluster" {
  name     = "${var.cluster-name}"
  role_arn = "${aws_iam_role.eks-s12n-demo-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.eks-s12n-demo-cluster.id}"]
    subnet_ids         = ["${aws_subnet.eks-s12n-demo-public.*.id}", "${aws_subnet.eks-s12n-demo-private.*.id}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy",
  ]
}
