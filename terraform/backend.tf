terraform {
  backend "http" {
    address = var.backend_address
    lock_address = var.lock_address
    unlock_address = var.unlock_address
    username = var.gitlab_user
    password = var.gitlab_token
    lock_method = "POST"
    unlock_method = "DELETE"
    retry_wait_min= "5"
  }
}