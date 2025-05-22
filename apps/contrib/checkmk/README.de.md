# Hetzner Cloud Checkmk

<img src="images/checkmk-logo.png" height="100px">
<br>

[Checkmk](https://checkmk.com/) ist eine umfassende IT-Monitoring-Lösung, die eine einfache und schnelle Überwachung von Netzwerken, Servern, Anwendungen und Cloud-Umgebungen ermöglicht.

[![Deploy to Hetzner Cloud](../../shared/images/deploy_to_hetzner.png)](https://console.hetzner.cloud/deploy/checkmk)

Sie können Checkmk über die [Hetzner Cloud Console](https://console.hetzner.cloud) oder die [Hetzner Cloud API](https://docs.hetzner.cloud/#servers-create-a-server) installieren.

## Getting Started

Erstellen Sie sich Ihren Server wie gewohnt über die [Hetzner Cloud Console](https://console.hetzner.cloud). Alternativ zum Betriebssystem können Sie eine App wählen, die Sie gerne vorinstalliert hätten.

Checkmk wird dann auf dem Server vorinstalliert, aber noch nicht aktiviert.

Um Checkmk zu aktivieren, melden Sie sich bitte auf Ihrem Server an:

- Per _SSH-Key_, falls Sie beim Erstellen Ihres Servers einen angegeben haben
- Per _root-Passwort_, das Sie beim Erstellen Ihres Servers per E-Mail von uns erhalten haben, wenn kein SSH-Key angegeben wurde

Dadurch wird Checkmk aktiviert und die URL der Verwaltungsoberfläche angezeigt.

## Hetzner Cloud API

Anstelle der Hetzner Cloud Console kann zum Einrichten eines Checkmk Servers auch die Hetzner Cloud API genutzt werden.

- Zum Beispiel per Curl-Befehl über die Kommandozeile

  ```
  curl \
     -X POST \
     -H "Authorization: Bearer $API_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"name":"my-checkmk-server", "server_type":"cpx11", "image":"checkmk"}' \
     'https://api.hetzner.cloud/v1/servers'
  ```

- Oder über [hcloud-cli](https://github.com/hetznercloud/cli)

  ```
  hcloud server create --name my-checkmk-server --type cpx11 --image checkmk
  ```

## Image Inhalt

### Betriebssystem

- [x] Ubuntu 24.04

### Installierte Pakete

Dieses Image enthält Checkmk und alle anderen aufgeführten Anwendungen als Pakete.

| NAME       | LIZENZ            |
| ---------- | ------------------ |
| Checkmk    | GPLv2              |

## Links

Weitere Informationen über die installierten Pakete erhalten Sie in den offiziellen Dokumentationen:

- [Checkmk](https://docs.checkmk.com/latest/en/install_packages_debian.html)

Weitere Informationen über Hetzner Cloud und Hetzner Cloud Apps erhalten Sie in unserer offiziellen Dokumentation:

- [Hetzner Cloud Dokumentation](https://docs.hetzner.com/de/cloud/)
- [Hetzner Cloud API](https://docs.hetzner.cloud/)
