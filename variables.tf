variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  default = "peach-eks"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "958056551390",
    "958056551390",
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::958056551390:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
      username = "AWSServiceRoleForAmazonEKS"
      groups   = ["system:masters"]
    },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::958056551390:user/terraform"
      username = "terraform"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::958056551390:user/peach"
      username = "peach"
      groups   = ["system:masters"]
    },
  ]
}
