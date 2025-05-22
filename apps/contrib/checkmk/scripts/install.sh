#!/bin/bash
#set -x

# Get the Checkmk pubkey to verify the
wget https://download.checkmk.com/checkmk/Check_MK-pubkey.gpg -O /tmp/Check_MK-pubkey.gpg
# Import key
gpg --import /tmp/Check_MK-pubkey.gpg

# Download and add the Checkmk GPG key
wget https://download.checkmk.com/checkmk/${application_version}/check-mk-raw-${application_version}_0.noble_amd64.deb -O /tmp/check-mk-raw-${application_version}_0.noble_amd64.deb
# Install Checkmk
apt install -y /tmp/check-mk-raw-${application_version}_0.noble_amd64.deb

# Install Certbot
apt install -y certbot python3-certbot-apache
