#!/usr/bin/env sh

sudo kubectl get ingress -A --sort-by=metadata.name -o yaml | yq '[.items[] as $item | {"name":$item.metadata.name, "url": "https://" + $item.spec.rules[0].host}]'

sudo kubectl get ingressroute -A --sort-by=metadata.name -o yaml | yq '[.items[] as $item | {"name":$item.metadata.name, "url": "https://" + $item.spec.routes[0].match}]'
