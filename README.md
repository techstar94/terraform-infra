# Terraform Infrastructure Provisioning

This repo will allow you to provision a EC2 instance on AWS cloud provider. The EC2 instances provisoned will come with Docker installed on it.

## Pre-requisites

There are some prequisits to get started.

* You need to have an AWS account of your own
* Ensure you have AWS Access Key and Secret Access Key

### Set access key and secret access key as environment variables

Open the command prompt as administrator and set the below environment vaiables. these will provide Authenticaiton details to "AWS Provider" section in you main terraform file.

* Windows:
```
setx /M AWS_DEFAULT_REGION "us-east-1"
setx /M AWS_ACCESS_KEY_ID "ABCDEFGHIJKLMNOPQRST"
setx /M AWS_SECRET_ACCESS_KEY "ABCDEfghijklmnoPQRST1234567890ABCDEFGHIJ"
```

* Linux:
```
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ACCESS_KEY_ID="ABCDEFGHIJKLMNOPQRST"
export AWS_SECRET_ACCESS_KEY="ABCDEfghijklmnoPQRST1234567890ABCDEFGHIJ"
```