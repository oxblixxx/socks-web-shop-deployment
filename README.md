# pipeline

This code deploys the socks web app an open source project with nginx proxy server in a kubernetes cluster using :
1. Terraform
2. AWS
3. Jenkins
4. Prometheus for monitoring
5. Ubuntu

# Setup tools required
In the `bin` folder, make the files executable:

```sh
chmod +x terraform
chmod +x aws
```

# How to deploy the cluster

### Creating a Jenkins Server.
---
Configure your AWS credentials on your terminal.

```sh
aws configure
```

follow the prompt. To confirm if you logged in succesfully, run

```sh
aws sts get-caller-identity
```

Confirm if you have [terraform](https://developer.hashicorp.com/terraform/install) installed on your local machine with 

```
terraform -version
```

clone this repo, cd to `jenkins-server` directory. To set up the jenkins-server, run the configuration plan.


```sh
Terraform plan
```

Update the `key_pair` variable with a key pair created from the console

To apply the configuration, run by a prompt of yes:

```sh
Terraform apply -var-file=variables.tfvars
```


Succesfully running that command, there is an output of the instance public ipv4 address.


copy & paste that to your browser mapping it to port 8080 i.e `<public-address>:8080`


SSH to the instance to copy the password from your specified directory as prompted.

Create a new item for pipeline, choose git, add this repo as the source. Here is the [Jenkinsfile](https://github.com/oxblixxx/socks-web-shop-deployment/blob/slave/Jenkinsfile) to run the pipeline from

Then run your  build.

![pipeline](pipeline.jpg)


## Deploying 

Here is my socks web deployment
![socks-web](socks.jpg)

here is my nginx deployment
![nginx](nginx.jpg)

here is my grafana 

![](grafana.jpg)

![ga](grafa.jpg)

