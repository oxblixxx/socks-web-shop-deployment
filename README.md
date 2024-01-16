# pipeline

This code deploys the socks web app with nginx proxy server in a kubernetes cluster using :
1. Terraform
2. AWS
3. Jenkins
4. Prometheus for monitoring
5. Terraform

# How to deploy the cluster

### Creating a Jenkins Server.
---
Configure your AWS credentials on your terminal.

```
aws configure
```

follow the prompt. To confirm if you logged in succesfully, run

```
aws sts get-caller-identity
```

confirm if you have terraform installed on your local machine with 

```
terraform -version
```


clone this repo, cd to `jenkins-server` directory. To see the configuration plan, run:

```sh
Terraform plan
```

To apply the configuration, run:

```sh
Terraform apply-auto approve
```


Succesfully running that command, there is an output of the instance public ipv4 address.


copy & paste that to your browser mapping it to port 8080 i.e `<public-address>:8080`


Copy the password from your instance directory as prompted

create a new item for pipeline, choose git, add this repo as the source. Here is the [Jenkinsfile](https://github.com/oxblixxx/socks-web-shop-deployment/blob/slave/Jenkinsfile) to run the pipeline from

Then run your  build.

![pipeline](pipeline.jpg)

Here is my socks web deployment
![socks-web](socks.jpg)

here is my nginx deployment
![nginx](nginx.jpg)

here is my grafana 

![](grafana.jpg)

![ga](grafa.jpg)

