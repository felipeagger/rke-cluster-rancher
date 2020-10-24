#!/usr/bin/env bash

# Disable selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Disable swap
swapoff -a
sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

echo "Starting Instalation of Docker"

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

echo "Install Docker..."
curl -fsSL https://get.docker.com | bash

sudo systemctl enable --now docker
systemctl status docker | grep "Active:"
sudo usermod -aG docker vagrant
sudo reboot