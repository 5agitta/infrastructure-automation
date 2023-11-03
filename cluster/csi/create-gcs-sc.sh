kubectl apply -k gcs
kubectl create secret generic csi-gcs-secret-mounter --from-file=key=credentials/gcp-credentials.json
kubectl create secret generic csi-gcs-secret-creator --from-file=key=credentials/gcp-credentials.json
kubectl apply -f gcp/storageclass.yaml
