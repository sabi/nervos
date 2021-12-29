# nervOS

nervOS is under development, but the alpha is available.  In general, its current state, nervOS is compatible with any Linux distribution using the `apt` package manager; this includes: Debian, Ubuntu, etc. We are using Debian 11 for our development environment.

## Installation
- Prerequisite: Linux machine. Currently this has only been tested with a fresh installation of Debian 11 without any of the recommend software installed.  In theory this should work the same for server versions of any major distro with the `apt` package manager.
- To install workstation build for local development: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s workstation` 
- To install server build for production servers: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s server`

## Things to know
- Change Desktop wallpaper and color theme to image: `wal -i "/path/to/image"`

## Github Repos to Mention
- [pywal](https://github.com/dylanaraps/pywal)
