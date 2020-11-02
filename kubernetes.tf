resource "kubernetes_namespace" "user_namespace" {
  metadata {
    name = var.user_namespace
  }
}