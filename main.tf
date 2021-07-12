resource "helm_release" "argocd" {
  name  = "argocd"
  namespace = "argocd"
  create_namespace = true
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "3.8.1"
  #force_update = true
  values = [
    templatefile("values/argocd.yaml", {
      test = "testings"
    })
  ]
}
