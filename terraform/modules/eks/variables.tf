variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "node_group_instance_types" {
  description = "EC2 instance types for node groups"
  type        = list(string)
}

variable "node_group_desired_size" {
  description = "Desired size of node group"
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum size of node group"
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum size of node group"
  type        = number
}