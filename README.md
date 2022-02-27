# nervOS

nervOS is under development, but here are the files being used to create the image.  In general, its current state, nervOS is compatible with any Linux distribution using the `apt` package manager; this includes: Debian, Ubuntu, etc. We are using Debian 11 for our development environment.

## Description

nervOS is a Linux distro based on Debian.  nervOS is distro for developers. Designed to be used on your workstation with workflow in mind. Use the same distro for your production deployments.  

## Installation
- Prerequisite: Linux machine. Currently this has only been tested with a fresh installation of Debian 11 without any of the recommend software installed.  In theory this should work the same for server versions of any major distro with the `apt` package manager.
- To install workstation build for local development: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s workstation` 
- To install server build for production servers: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s server`

## Quick and Dirty Installs
- Install Bash profile and aliases: `wget -O ~/.bashrc https://raw.githubusercontent.com/sabi/nervos/main/config/bash/bashrc && wget -O ~/.bash_aliases https://raw.githubusercontent.com/sabi/nervos/main/config/bash/bash_aliases && source ~/.bashrc`

## Operations

### i3
- Create a new shell: `mod+Enter`
- Open application other than shell: `mod+d` then type and hit `Enter`
- Close a panel: Get window in focus, then `mod+Shift+q`
- Split next panel vertically: `mod+v`
- Split next panel horizontally: `mod+h`
- Move panel to <workspace #>: `mod+Shift+<number of workspace>`
- Select another panel within current workspace: `mod+Arrow Keys`
- Move to <workspace #>: `mod+Shift+<number of workspace>`

### Bash Aliases
##### Quality of Life
- 

### Fun
- Change Desktop wallpaper and color theme to image: `wal -i "/path/to/image"`

## Github Repos to Mention
- [pywal](https://github.com/dylanaraps/pywal)

## Notes

- Docker Flask App builder assumes app.py is entrypoint, assumes whole project inside directory called `app`, assumes `requirements.txt` is present in `app`, assumes Flask app is listening on `host='0.0.0.0', port=80`
