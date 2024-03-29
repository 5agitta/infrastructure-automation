sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list << EOF
deb https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse
EOF

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt jammy main
EOF

sudo apt --assume-yes install gnupg
wget -qO- https://www.mongodb.org/static/pgp/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb-org-6.0.asc
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A | sudo tee /etc/apt/trusted.gpg.d/pritunl.asc
sudo apt update
sudo apt --assume-yes install pritunl mongodb-org
sudo systemctl start pritunl mongod
sudo systemctl enable pritunl mongod

# after navigating to https://<server-ip>
sudo pritunl setup-key
sudo pritunl default-password

# set custom certificates
cd ./certificates/pritunl/
./gen-cert.sh

# copy the keys to the server
scp -r ./certificates/pritunl/ root@<server-ip>:/home/<user>
# on the server
sudo pritunl set app.server_cert "$(cat /home/<user>/pritunl.pem)"
sudo pritunl set app.server_key "$(cat /home/<user>/pritunl-key.pem)"
