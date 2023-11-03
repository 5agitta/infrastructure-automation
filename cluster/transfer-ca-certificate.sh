# transfer to controllers
for i in {10..11}; do
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo mkdir -p /var/lib/k0s/pki
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo mkdir -p /var/lib/k0s/pki/etcd

	scp -i ~/.ssh/gcloud $PROJECT_ROOT/certificates/ca/ca.pem "core@10.240.0.$i":/home/core/ca.crt
	scp -i ~/.ssh/gcloud $PROJECT_ROOT/certificates/ca/ca-key.pem "core@10.240.0.$i":/home/core/ca.key

	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.crt /var/lib/k0s/pki/ca.crt
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.key /var/lib/k0s/pki/ca.key
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.crt /var/lib/k0s/pki/etcd/ca.crt
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.key /var/lib/k0s/pki/etcd/ca.key
done;

# transfer to workers
for i in {138..139}; do
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo mkdir -p /var/lib/k0s/pki
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo mkdir -p /var/lib/k0s/pki/etcd

	scp -i ~/.ssh/gcloud $PROJECT_ROOT/certificates/ca/ca.pem "core@10.240.0.$i":/home/core/ca.crt
	scp -i ~/.ssh/gcloud $PROJECT_ROOT/certificates/ca/ca-key.pem "core@10.240.0.$i":/home/core/ca.key

	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.crt /var/lib/k0s/pki/ca.crt
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.key /var/lib/k0s/pki/ca.key
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.crt /var/lib/k0s/pki/etcd/ca.crt
	ssh -i ~/.ssh/gcloud "core@10.240.0.$i" sudo cp /home/core/ca.key /var/lib/k0s/pki/etcd/ca.key
done;