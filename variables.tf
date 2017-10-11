variable "namespace" {
  default = "global"
}

variable "stage" {
  default = "default"
}

variable "name" {}

variable "bucket" {}

variable "path" {
  default = "/"
}

variable "user_data" {
  type    = "list"
  default = []
}
