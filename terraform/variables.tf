#
# Variables Configuration
#

variable "cluster-name" {
  default = "eks-s12n-demo"
  type    = "string"
}
variable "ssh-key" {
  default = "aws-public"
  type    = "string"
}
