![banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# DOTNETSDK
![size](https://img.shields.io/docker/image-size/11notes/dotnetsdk/8?color=0eb305)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![version](https://img.shields.io/docker/v/11notes/dotnetsdk/8?color=eb7a09)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![pulls](https://img.shields.io/docker/pulls/11notes/dotnetsdk?color=2b75d6)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)[<img src="https://img.shields.io/github/issues/11notes/docker-DOTNETSDK?color=7842f5">](https://github.com/11notes/docker-DOTNETSDK/issues)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxyZWN0IHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgZmlsbD0idHJhbnNwYXJlbnQiLz4KICA8cGF0aCBkPSJtMTMgNmg2djdoN3Y2aC03djdoLTZ2LTdoLTd2LTZoN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+)

Build .NET core apps with the default tooling present

# SYNOPSIS 📖
**What can I do with this?** Build .NET core applications with the default tooling present.

# BUILD 🚧
```yaml
FROM 11notes/dotnetsdk:9
RUN set -ex; \
  git clone https://github.com/some/repo; \
  cd ./repo; \
  dotnet msbuild -restore ..;
```

# DEFAULT SETTINGS 🗃️
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user name |
| `uid` | 1000 | [user identifier](https://en.wikipedia.org/wiki/User_identifier) |
| `gid` | 1000 | [group identifier](https://en.wikipedia.org/wiki/Group_identifier) |
| `home` | / | home directory of user docker |

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Will activate debug option for container image and app (if available) | |

# MAIN TAGS 🏷️
These are the main tags for the image. There is also a tag for each commit and its shorthand sha256 value.

* [8](https://hub.docker.com/r/11notes/dotnetsdk/tags?name=8)

# REGISTRIES ☁️
```
docker pull 11notes/dotnetsdk:8
docker pull ghcr.io/11notes/dotnetsdk:8
docker pull quay.io/11notes/dotnetsdk:8
```

# SOURCE 💾
* [11notes/dotnetsdk](https://github.com/11notes/docker-DOTNETSDK)

# PARENT IMAGE 🏛️
* [11notes/alpine:stable](https://hub.docker.com/r/11notes/alpine)

# BUILT WITH 🧰
* [dotnet](https://dotnet.microsoft.com/en-us/)
* [11notes/util](https://github.com/11notes/docker-util)

# GENERAL TIPS 📌
> [!TIP]
>* Use a reverse proxy like Traefik, Nginx, HAproxy to terminate TLS and to protect your endpoints
>* Use Let’s Encrypt DNS-01 challenge to obtain valid SSL certificates for your services

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-dotnetsdk/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-dotnetsdk/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-dotnetsdk/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 01.09.2025, 09:51:10 (CET)*