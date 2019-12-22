# docker-terraform
Docker image with Terraform, Azure and additional tools.

## Usage

Start with `docker run pietere/terraform` to show instructions on how to create aliases for CLI tool in the container.

Note: the current working directory is mounted as `$HOME` in the container.
Using `az` and `terraform` will result in `.azure/` and `.terraform.d/` directories being created in the working directory.


## Know issues

none
