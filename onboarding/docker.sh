echo enter username
read $USER

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

