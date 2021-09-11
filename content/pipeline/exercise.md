---
title: Container Pipeline Exercise
weight: 49
---


aws s3 mb s3://devsecops-james-strong --region us-west-2
make_bucket: devsecops-james-strong

go Terraform file 

terraform/config.tf

terraform {
backend "s3" {
bucket = "devsecops-james-strong"
key    = "devsecops-james-strong/terraform_state"
region = "us-west-2"
}
}


