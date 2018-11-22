#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EC2 Security Group to allow networking traffic
#  * Data source to fetch latest EKS worker AMI
#  * AutoScaling Launch Configuration to configure worker instances
#  * AutoScaling Group to launch worker instances
#

resource "aws_iam_role" "eks-s12n-demo-node" {
  name = "eks-s12n-demo-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "for-autoscaler" {
  name = "for-autoscaler"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:DescribeTags",
                "autoscaling:TerminateInstanceInAutoScalingGroup"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
  role = "${aws_iam_role.eks-s12n-demo-node.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.eks-s12n-demo-node.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.eks-s12n-demo-node.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.eks-s12n-demo-node.name}"
}

resource "aws_iam_instance_profile" "eks-s12n-demo-node" {
  name = "eks-s12n-demo"
  role = "${aws_iam_role.eks-s12n-demo-node.name}"
}

resource "aws_security_group" "eks-s12n-demo-node" {
  name        = "eks-s12n-demo-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.eks-s12n-demo.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "eks-s12n-demo-node",
     "kubernetes.io/cluster/${var.cluster-name}", "owned",
    )
  }"
}

resource "aws_security_group_rule" "eks-s12n-demo-node-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.eks-s12n-demo-node.id}"
  source_security_group_id = "${aws_security_group.eks-s12n-demo-node.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "eks-s12n-demo-node-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 0
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.eks-s12n-demo-node.id}"
  source_security_group_id = "${aws_security_group.eks-s12n-demo-cluster.id}"
  to_port                  = 65535
  type                     = "ingress"
}

data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-v25"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}

# https://aws.amazon.com/blogs/opensource/improvements-eks-worker-node-provisioning/
locals {
  demo-node-userdata = <<USERDATA
#!/bin/bash -xe
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.eks-s12n-demo-cluster.endpoint}' --b64-cluster-ca '${aws_eks_cluster.eks-s12n-demo-cluster.certificate_authority.0.data}' '${aws_eks_cluster.eks-s12n-demo-cluster.name}'
USERDATA
}

resource "aws_launch_configuration" "eks-s12n-demo" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.eks-s12n-demo-node.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "t2.large"
  name_prefix                 = "eks-s12n-demo"
  security_groups             = ["${aws_security_group.eks-s12n-demo-node.id}"]
  user_data_base64            = "${base64encode(local.demo-node-userdata)}"
  key_name                    = "aws-public"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "eks-s12n-demo" {
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.eks-s12n-demo.id}"
  max_size             = 3
  min_size             = 1
  name                 = "eks-s12n-demo"
  vpc_zone_identifier  = ["${aws_subnet.eks-s12n-demo-private.*.id}"]

  tag {
    key                 = "Name"
    value               = "${aws_eks_cluster.eks-s12n-demo-cluster.name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
  
  tag {
    key = "k8s.io/cluster-autoscaler/enabled"
    value = "whatever"
    propagate_at_launch = false
  }
}
