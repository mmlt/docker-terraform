FROM ubuntu:18.04

ARG TERRAFORM_VERSION=0.12.18

ENV  TERRAFORM_VERSION $TERRAFORM_VERSION

# Tools
RUN apt-get update \
 && apt-get install -y curl jq python unzip \
 && rm -rf /var/lib/apt/lists/* 

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Terraform
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip /tmp/terraform.zip -d /usr/bin

# Create user
COPY ["./createuser.sh", "./run.sh", "/"]
ENTRYPOINT ["/run.sh"]
CMD bash