# pipeline

URL = oxlava.tech
socks domain is [here](http://socks.oxlava.tech) and
web domain is [here](http://web.oxlava.tech


This code deploys a socks web app and nginx with a kubernetes cluster using :
1. Terraform
2. AWS
3. Jenkins
4. Prometheus
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


clone this repo, cd to jenkins-server directory. Then run:

```
Terraform apply-auto approve
```

Succesfully running that command, there is an output of the instance public ipv4 address.

copy & paste that to your browser mapping it to port 8080.

Copy the password from your instance directory as prompted

create a new item for pipeline, choose git. link this repo.

Then build.

![pipeline](pipeline.jpg)

Here is my socks web deployment
![socks-web](socks.jpg)

here is my nginx deployment
![nginx](nginx.jpg)

here is my grafana 

![](grafana.jpg)

![ga](grafa.jpg)

