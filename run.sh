#! /bin/bash

#TODO fix enter-terraform-azure-container warnings: (hint: don't use su -c)
#  bash: cannot set terminal process group (25): Inappropriate ioctl for device
#  bash: no job control in this shell


if [ -n "$XXNAME" ]; then
  /createuser.sh $XXNAME $XXUID $XXGID "ANSIBLE_AZURE_AUTH_SOURCE"
  su - $XXNAME -c '"$0" "$@"' -- "$@"
else
  if [ $# = 1 ]; then imagename=$1; else imagename="pietere/terraform"; fi

  echo "# This container provides Terraform $TERRAFORM_VERSION, Azure and additionals tools. "
  echo "#"
  echo "# Source this output to add aliases for frequently used commands;"
  echo "#	  . <(docker run --rm $imagename $imagename) OR (docker run --rm $imagename $imagename) >> ~/.bash_aliases"
  echo "# then use aliases like this;"
  echo "#   az login"
  echo "#   az --version"
  echo "#   terraform version"
  echo "#   enter-terraform-azure-container"
  echo "#"
  echo "#"
  echo "# Note: the CWD is mounted as ~ in the container."
  echo 
  echo "alias terraform=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \\\$(pwd):/home/\$(id -un) $imagename terraform \""
  echo "alias az=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \\\$(pwd):/home/\$(id -un) $imagename az \""
  echo "alias enter-terraform-azure-container=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \\\$(pwd):/home/\$(id -un) $imagename \""
fi
