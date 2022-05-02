
variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "name" {
  default = "phpmyadmin-with-basic-auth"
}

variable "basic_auth_user" {
  default = "Basic auth user name"
}

variable "basic_auth_password" {
  default   = "Basic auth password"
  sensitive = true
}