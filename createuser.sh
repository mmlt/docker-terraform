#!/bin/bash
# Create an user and copy environment variables to .profile
# Usage: 
#	createuser name uid gid env
# Example:
#	createuser developer 1000 1000 "PATH DISPLAY"
groupadd $1 -g $3
useradd --gid $3 -u $2 --groups sudo -s /bin/bash -m $1 2>/dev/null # suppress useradd: warning: the home directory already exists.
echo $1:password | chpasswd
# Pass environment
#rm -f /home/$1/.profile
for v in $4; do echo "export $v=${!v}" >>  /home/$1/.profile; done
