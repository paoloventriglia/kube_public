variable "project_id" {
  description = ""
  default = ""
}

variable "name" {
  description = ""
  default = ""
}

variable "application" {
  description = ""
  default = ""
}

variable "vm_depends_on" {
  default = ""
  description = ""
}

variable "machine_type" {
  description = ""
  default = "e2-small"
}

variable "zone" {
  description = ""
  default = "europe-west2-a"
}

variable "region" {
  default = ""
  description = ""
}

variable "image" {
  description = ""
  default = ""
}

variable "subnetwork" {
  description = ""
  default = ""
}

variable "startup_script" {
  description = ""
  default = ""
}

variable "ssh_keys" {
  description = ""
  default = ""
}

variable "tags" {
  description = ""
  default = ""
}