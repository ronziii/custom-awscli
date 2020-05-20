Custom-AWSCLI
=============

## Introduction

Custom-AWSCLI is a simple set of CLI commands that you can use to list resources on AWS.

## Quickstart

### Prerequisites

* [awscli](http://aws.amazon.com/cli/)
* [bash](https://www.gnu.org/software/bash/)

### Installation

As shown below, you may simply clone the GitHub repo to your home folder and source the files required.

```shell
$ git clone https://github.com/ronnie420/custom-awscli.git ~/.custom-awscli
```

Assuming the repo is in your home folder, source the main file and ensure to provide the credential file as a paramater as shown below

The credential file should have format as:
AWS_ACCESS_KEY_ID = AKIAXXXXXXX
AWS_SECRET_ACCESS_KEY = XXXXXXXXXXX
AWS_REGION = xx_xxxxx

```shell
$ source ~/.custom-awscli/bin/main.sh --credentials=/path/to/credential-file
```

## Usage

### Resource Listing Commands

*** List IAM Users ***
```shell
$ list-iam-users
```

*** List EC2 Instances ***
```shell
$ list-ec2-instances
```

*** List ECR Repositories ***
```shell
$ list-ecr-repositories
```

*** List ECS Clusters ***
```shell
$ list-ecs-clusters
```

*** List S3 Buckets ***
```shell
$ list-s3-buckets
```

*** List RDS Instances ***
```shell
$ list-rds-instances
```