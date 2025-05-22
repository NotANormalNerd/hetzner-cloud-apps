#!/bin/bash

# Test if Checkmk is installed
if ! dpkg -l | grep -q check-mk-raw; then
  echo "Checkmk is not installed."
  exit 1
fi

# Test if Checkmk service is running
if ! systemctl is-active --quiet omd; then
  echo "Checkmk service is not running."
  exit 1
fi

# Test if apache web interface is accessible
if ! curl -s --head http://localhost/ | grep "200 OK" > /dev/null; then
  echo "apache web interface is not accessible."
  exit 1
fi

echo "All tests passed. Checkmk is installed and running."
