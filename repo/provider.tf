terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.3"
    }
    kubernetes-alpha = {
      source = "hashicorp/kubernetes-alpha"
      version = "~> 0.5"
    }
  }
}
provider "aws" {
  region = "us-west-2"
  profile = "ssm_aws"
}
provider "kubernetes" {
  #config_path = "/home/kkangie/.kube/config"
  config_path = "/home/ekang/.kube/config"
}
provider "kubernetes-alpha" {
  #config_path = "/home/kkangie/.kube/config"
  config_path = "/home/ekang/.kube/config"
  #server_side_planning = true
  #server_side_planning = false
}
provider "helm" {
  kubernetes {
    #config_path = "/home/kkangie/.kube/config"
    config_path = "/home/ekang/.kube/config"
  }
}
