variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = "string"
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = "string"
}

variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = "string"
}

variable "bucket" {
  default = "Bucket name to store user data script"
}

variable "path" {
  default     = "/"
  description = "Path to store user data script in bucket"
}

variable "flavor" {
  default     = "debian-systemd"
  description = "Flavor depends of OS and init system"
}

variable "user_data" {
  type        = "list"
  default     = []
  description = "User data scripts content"
}
