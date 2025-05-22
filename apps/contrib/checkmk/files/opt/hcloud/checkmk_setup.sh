#!/bin/bash
#set -x
#
# This will enable GitLab, configure it with user input
# and optionally set up LE.
#
cat <<EOF
 ______________________________________________________________________
|                                                                      |
|   Welcome to the Chechmk One-Click-App configuration.                |
|                                                                      |
|   In this process checkmk will be set up accordingly.                |
|   You only need to set your desired instance name which will be      |
|   used to configure checkmk and allow Let's Encrypt to obtain a      |
|   valid SSL Certificate.                                             |
|   Please make sure your Domain exists first.                         |
|                                                                      |
|   Please enter the Domain in following pattern: checkmk.example.com  |
|______________________________________________________________________|
EOF

cmk_user_input(){

  while [ -z $instance_name ]
  do
    read -p "Your Instance Name: " instance_name
  done
}

le_user_input(){

  while [ -z $domain ]
  do
    read -p "Your domain name: " domain
  done

  while [ -z $le_email ]
  do
    read -p "Your E-Mail address: " le_email
  done
}

echo -en "\n"
echo "Please enter your details to set up your new checkmk Instance."

cmk_user_input

while true
do
    echo -en "\n"
    read -p "Is the instance name correct? [Y/n] " confirm
    : ${confirm:="Y"}

    case $confirm in
      [yY][eE][sS]|[yY] ) break;;
      [nN][oO]|[nN] ) unset instance_name; cmk_user_input;;
      * ) echo "Please type y or n.";;
    esac
done

root_pass=$(openssl rand -base64 12)
omd create $instance_name --admin-password $root_pass

install_certbot(){

  while true
  do
    echo -en "\n"
    read -p "Is the domain and email name correct? [Y/n] " confirm
    : ${confirm:="Y"}

    case $confirm in
      [yY][eE][sS]|[yY] ) certbot --apache --agree-tos -m $le_email -d $domain; break;;
      [nN][oO]|[nN] ) unset instance_name; le_user_input;;
      * ) echo "Please type y or n.";;
    esac
  done

}

echo -en "\n\n"
  echo -en "Do you want to create a Let's Encrypt Certificate for checkmk? \n"
  read -p "Note that the domain needs to exist. [Y/n]: " le
  : ${le:="Y"}
    case $le in
        [Yy][eE][sS]|[yY] ) le_user_input; install_certbot;;
        [nN][oO]|[nN] ) echo -en "\nSkipping Let's Encrypt.\n";;
        * ) echo "Please type y or n.";;
    esac

# Remove startup script from .bashrc
sed -i "/chechmk_setup/d" ~/.bashrc

# use domain if available or ip if not
if [ -n "$domain" ]; then
  endpoint="$domain"
else
  endpoint=$(hostname -I | awk '{print $1}') # Get the first IP address
fi

cat <<EOF
 ______________________________________________________________________
|                                                                      |
|   Your checkmk instance is now available at:                         |
|                                                                      |
|   https://$endpoint/$instance_name/
|   Username: cmkadmin                                                 |
|   Password: $root_pass                                         |
|______________________________________________________________________|
EOF