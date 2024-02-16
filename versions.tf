# terraform {
#   required_version = ">= 0.13"

#   required_providers {
#     kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = ">= 1.7.0"
#     }
#   }
# }

# resource "kubectl_manifest" "test" {
#     yaml_body = <<YAML
# apiVersion: networking.k8s.io/v1
# kind: Ingress
# metadata:
#   name: expressapp-ingress
#   annotations:
#     nginx.ingress.kubernetes.io/rewrite-target: /
#     azure/frontdoor: enabled
# spec:
#   rules:
#   - http:
#       paths:
#       - path: /testpath
#         pathType: "Prefix"
#         backend:
#           serviceName: expressapp-deployment.yaml  # Specify the name of your existing service
#           servicePort: 80
# YAML
# }

# resource "kubectl_manifest" "expressapp-service" {
#     yaml_body = <<YAML
# apiVersion: networking.k8s.io/v1
# kind: Ingress
# metadata:
#   name: expressapp-service.yaml
#   annotations:
#     nginx.ingress.kubernetes.io/rewrite-target: /
#     azure/frontdoor: enabled
# spec:
#   rules:
#   - http:
#       paths:
#       - path: /testpath
#         pathType: "Prefix"
#         backend:
#           serviceName: expressapp-service
#           servicePort: 80
# YAML
# }