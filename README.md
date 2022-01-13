# Terraform Configerationg for GCP kubernates cluster
- [Creating the cluster with privet ip ](#run-terraform-command-with-terrafom)
- [Granting authrized neworks ](#run-terraform-command-with-terrafom)
- [Create restricted & private subnet ](#run-terraform-command-with-terrafom)
- [Creating bastion with SA to interact with GKE ](#run-terraform-command-with-terrafom)

- [Run terraform command ](#run-terraform-command-with-terrafom)

```bash
$ terraform init
$ terraform plan 
$ terraform apply
```

# Dockrize python application & deploy on cluster
- [Run docker command  ](#run-terraform-command-with-terrafom)
```bash
$ docker build -t gcr.io/PROJECT_NAME/IMAGE_NAME APP_PATH
$ docker push gcr.io/PROJECT_NAME/IMAGE_NAME
```
- [Run app locally ](#Run)
```bash
$ docker run -d --network=host redis 
$ docker run --network=host python-redis-py
```
# Create deployment from bastion
- [Insert your image in deployment.yaml  ](#run-terraform-command-with-terrafom)
- [From your bastion  ](#run-terraform-command-with-terrafom)
- [Run the following commands ](#run-terraform-command-with-terrafom)
```bash
$ sudo apt update
$ sudo apt install kubectl
$ curl -fsSL https://test.docker.com -o test-docker.sh
$ sudo sh test-docker.sh 
$ sudo usermod -aG docker ${USER}
$ gcloud auth configure-docker 
$ sudo reboot
```
- [Configure your vm to interact with cluster ](#run-terraform-command-with-terrafom)
```bash
$ gcloud container clusters get-credentials CLUSTER_NAME
```
# Create deployment using kubectl
- [run the following command ](#run-terraform-command-with-terrafom)
```bash
$ kubectl apply -f DEPLOYMENT_FILE.yaml
```