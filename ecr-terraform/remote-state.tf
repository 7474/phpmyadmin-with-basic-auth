terraform {
  backend "remote" {
    organization = "koudenpa"
    workspaces {
      name = "phpmyadmin-with-basic-auth-repo"
    }
  }
}
