# Hetzner Cloud Checkmk

<img src="images/checkmk-logo.png" height="100px">
<br>

[Checkmk](https://checkmk.com/) is a comprehensive IT monitoring solution that enables easy and fast monitoring of networks, servers, applications, and cloud environments.

[![Deploy to Hetzner Cloud](../../shared/images/deploy_to_hetzner.png)](https://console.hetzner.cloud/deploy/checkmk)

You can install Checkmk via the [Hetzner Cloud Console](https://console.hetzner.cloud) or the [Hetzner Cloud API](https://docs.hetzner.cloud/#servers-create-a-server).

## Getting Started

Create your server as usual using the [Hetzner Cloud Console](https://console.hetzner.cloud). As an alternative to the operating system, you can choose an app that you would like to have pre-installed.

Checkmk will then be preinstalled on the server, but it will not yet be activated.

To activate Checkmk, please log in to your server:

- Use an _SSH key_ if you were provided one when you created your server.
- Use the _root-password_ which we sent to you via email when you created your server; use this if you did not get an SSH key.

This will activate Checkmk and display the URL of the administration interface.

## Hetzner Cloud API

Instead of using the Hetzner Cloud Console, you can use the Hetzner Cloud API to set up a server with Checkmk.

- For example, via a curl command from the command line:

  ```
  curl \
     -X POST \
     -H "Authorization: Bearer $API_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"name":"my-checkmk-server", "server_type":"cpx11", "image":"checkmk"}' \
     'https://api.hetzner.cloud/v1/servers'
  ```

- Or via [hcloud-cli](https://github.com/hetznercloud/cli)

  ```
  hcloud server create --name my-checkmk-server --type cpx11 --image checkmk
  ```

## Image content

### Operating system

- [x] Ubuntu 24.04

### Installed packages

This image contains Checkmk and all other listed applications as packages.

| NAME       | LICENSE            |
| ---------- | ------------------ |
| Checkmk    | GPLv2              |

## Links

For more information about the installed packages, see the official documentation:

- [Checkmk](https://docs.checkmk.com/latest/en/install_packages_debian.html)

For more information about Hetzner Cloud and Hetzner Cloud Apps, please see our official documentation:

- [Hetzner Cloud Documentation](https://docs.hetzner.com/de/cloud/)
- [Hetzner Cloud API](https://docs.hetzner.cloud/)
