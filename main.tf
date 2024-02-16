terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  config_context_cluster = "kind-cluster-proj"
}

resource "kubectl_manifest" "test" {
  yaml_body = <<-YAML
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: test-ingress
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
        azure/frontdoor: enabled
    spec:
      rules:
      - http:
          paths:
          - path: /testpath
            pathType: "Prefix"
            backend:
              serviceName: expressappdeployment.yaml
              servicePort: 80
  YAML
}

resource "kubectl_manifest" "test2" {
  yaml_body = <<-YAML
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: test-ingress2
      annotations:
        nginx.ingress.kubernetes.io/rewrite-target: /
        azure/frontdoor: enabled
    spec:
      rules:
      - http:
          paths:
          - path: /testpath
            pathType: "Prefix"
            backend:
              serviceName: expressappservice.yaml
              servicePort: 80
  YAML
}