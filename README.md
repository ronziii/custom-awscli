Custom-AWSCLI
=============

## Introduction

Custom-AWSCLI is a simple set of CLI commands that you can use to list resources on AWS.

## Quickstart

### Prerequisites

* [awscli](http://aws.amazon.com/cli/)
* [bash](https://www.gnu.org/software/bash/)

### Installation

As shown below, you may simply clone the GitHub repo to your home folder.

```shell
$ git clone https://github.com/ronnie420/custom-awscli.git ~/.custom-awscli
```

Assuming the repo is in your home folder, ensure you source the main file and provide the credential file as a paramater as shown below

```shell
$ cd ~/.custom-awscli/bin
$ source install.sh --credentials=/path/to/credential-file
```

The credential file should have format as:

AWS_ACCESS_KEY_ID=AKIAXXXXXXX

AWS_SECRET_ACCESS_KEY=XXXXXXXXXXX

AWS_REGION=xx_xxxxx



## Usage

### Resource Listing Commands

Execute the below commands on your bash terminal after successful installation.

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
*** Show Help Menu ***
```shell
$ cli-menu
	Usage: show_usage --credentials=<path>
        show_usage [--help]
        show_usage [list-iam-users|list-ec2-instances|list-s3-buckets|list-rds-instances|list-ecs-clusters|list-ecr-repositories]
```
