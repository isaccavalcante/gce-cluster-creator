# GCE Cluster Creator

This repo can create a Kubernetes Cluster using Google Cloud Engine on Google [Cloud Platform](https://console.cloud.google.com)

## Terraform module

Rename the `project` variable value in [provider.tf](provider.tf)
Create a [service account key](https://console.cloud.google.com/apis/credentials/serviceaccountkey), give the proper permissions, download and rename it to `terraform-account.json`.

This will create `1` node, `n1-standard-1` machine type (1vCPU, 3.75GB) , with `ubuntu-1804-lts` image and `myuser` ssh username. It will use your `~/.ssh/id_rsa.pub` key. Feel free to change those parameters accordingly to your needs.


To create, run the following command inside terraform directory: 
```sh
terraform apply 
```

To delete, run the following command:
```sh
terraform destroy 
```

## Ansible module

I know that there are already existent roles which install and configure services like [docker](https://github.com/geerlingguy/ansible-role-docker), [kubernetes](https://github.com/geerlingguy/ansible-role-kubernetes), [nginx](https://github.com/geerlingguy/ansible-role-nginx) and so on, but I decided to use my own roles for learning purposes.

WIP