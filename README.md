# nervOS

nervOS is under development, but the alpha is available.  In general, its current state, nervOS is compatible with any Linux distribution using the `apt` package manager; this includes: Debian, Ubuntu, etc. We are using Debian 11 for our development environment.

## Installation
- Prerequisite: Linux machine. Currently this has only been tested with a fresh installation of Debian 11 without any of the recommend software installed.  In theory this should work the same for server versions of any major distro with the `apt` package manager.
- To install workstation build for local development: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s workstation` 
- To install server build for production servers: `wget -O - https://raw.githubusercontent.com/sabi/nervos/main/nervos.sh | sudo bash -s server`

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
