resource "helm_release" "argocd" {
  name = "argocd"
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

resource "kubernetes_secret" "argocd-github" {
  depends_on = [helm_release.argocd]
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
/*
resource "helm_release" "falco" {
  name = "falco"
  namespace = "monitoring"
  create_namespace = true
  repository = "https://falcosecurity.github.io/charts"
  chart = "falco"
  version = "1.15.3"
  
  set {
    name = "falcosidekick.enabled"
    value = "true"
  }

  set {
    name = "falcosidekick.webui.enabled"
    value = "true"
  }
}
*/
