variable "project_id" {
  default = ""
}

variable "zone" {
  default = "europe-west2-a"
}

variable "region" {
  default = "europe-west2"
}

variable "gke_depends_on" {
  default     = ""
  description = ""
}

variable "initial_node_count" {
  default     = 1
  description = ""
}

variable "name" {
  default     = ""
  description = ""
}

variable "network" {
  description = ""
  default     = ""
}

variable "subnetwork" {
  description = ""
  default     = ""
}

variable "pods_range" {
  description = ""
  default     = ""
}

variable "services_range" {
  description = ""
  default     = ""
}

variable "master_cidr" {
  description = ""
  default     = ""
}

variable "node_count" {
  description = ""
  default     = 3
}

variable "max_pods_per_node" {
  description = ""
  default     = 10
}

variable "gke_machine_type" {
  description = ""
  default     = "e2-medium"
}

variable "auth_net" {
  default = ""
}