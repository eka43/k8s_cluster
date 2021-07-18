resource "helm_release" "argocd" {
  name = "argocd"
  namespace = "argocd"
  create_namespace = true
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "3.8.1"
  #force_update = true
  values = [
    templatefile("../values/argocd.yaml", {
      test = "testings"
    })
  ]
}

resource "kubernetes_secret" "argocd-github" {
  metadata {
    name = "argocd-github"
    namespace = "argocd"
  }
  type = "Opaque"
  data = {
    sshPrivateKey = data.aws_ssm_parameter.argocd-github.value
  }
}

data "aws_ssm_parameter" "argocd-github" {
  name = "/k8s/secrets/github/ssh-private-key-2"
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
