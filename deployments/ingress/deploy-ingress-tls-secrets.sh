kubectl delete -n ingress-nginx secret ingress-tls-secret

kubectl create -n ingress-nginx secret tls ingress-tls-secret \
--key "$PROJECT_ROOT/certificates/ingress/ingress-key.pem" \
--cert "$PROJECT_ROOT/certificates/ingress/ingress.pem"

