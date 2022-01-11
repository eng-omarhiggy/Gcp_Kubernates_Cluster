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
$ docker build -t REPOSITRYNAME:TAG
$ docker push REPOSITRYNAME:TAG
```

# Create deployment using kubectl
- [Insert you image in deployment.yaml  ](#run-terraform-command-with-terrafom)
- [From your bastion  ](#run-terraform-command-with-terrafom)
- [Fun kubcetl command ](#run-terraform-command-with-terrafom)
```bash
$ kubectl apply -f deployment.yaml
```
