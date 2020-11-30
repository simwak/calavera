# Fast Setup
This guide shows a fast setup with `k3s`. This is a single node setup, for more nodes follow [k3s Quick-Start Guide](https://rancher.com/docs/k3s/latest/en/quick-start/).  
The domain `simwak.dev` and email `example@simonwakenhut.me` here is an example. Please replace it with your domain and email.

Edit your DNS entries to point to the cluster like shown here
```
calavera.simwak.dev               A     your-node-address
*.calavera.simwak.dev             CNAME calavera.simwak.dev
*.editor.calavera.simwak.dev      CNAME calavera.simwak.dev
```

Tested on Ubuntu (ubuntu-focal-20.04-amd64-server-20201026) with t3.xlarge and 200 GB disk space.  
You need a lot of disk space for all components, otherwise they get evicted and the deployment fails.

``` bash
export USER=$(whoami)
export KUBECONFIG=/home/$USER/.kube/config

cd

# Install k3s
curl -sfL https://get.k3s.io | sh -
mkdir ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/$USER/.kube/config
sudo chown -R $USER /home/$USER/.kube

# Install Terraform
sudo apt-get install wget unzip -y
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip terraform_0.12.26_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install Helm
curl -sfL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash -

# Traefik 2 & Let's encrypt setup
kubectl config set-context --current --namespace=kube-system

helm uninstall traefik
helm repo add traefik https://containous.github.io/traefik-helm-chart
helm repo update

kubectl create namespace traefik
helm install --namespace=traefik traefik traefik/traefik

# Use your own E-Mail address here!
kubectl patch deployment traefik -n traefik --type "json" -p '[
{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--certificatesResolvers.production.acme.email=example@simonwakenhut.me"},
{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--certificatesResolvers.production.acme.storage=/data/acme.json"},
{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--certificatesResolvers.production.acme.httpChallenge.entryPoint=web"}]'

# Install Calavera
git clone https://github.com/simwak/calavera.git
cd calavera

cp examples/minimal.tfvars values.tfvars
# Adjust the values in values.tfvars to your needs (Domain, User, SMTP)
# You need to use your domain name at least.
sed -i "s|example.com|simwak.dev|g" values.tfvars

terraform init
terraform apply -var-file=values.tfvars --auto-approve

# Now please wait up to 20 minutes before using Calavera
```
