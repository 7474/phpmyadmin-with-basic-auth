resource "aws_apprunner_service" "phpmyadmin" {
  service_name = var.name

  source_configuration {
    # App Runner doesn't support automatic deployments for an image in an ECR Public repository.
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        port = "80"
        runtime_environment_variables = {
          PMA_ARBITRARY       = "1"
          BACIC_AUTH_USER     = var.basic_auth_user
          BACIC_AUTH_PASSWORD = var.basic_auth_password
        }
      }
      image_identifier      = "public.ecr.aws/g2g6t4l2/phpmyadmin-with-basic-auth-repo:latest"
      image_repository_type = "ECR_PUBLIC"
    }
  }
}
