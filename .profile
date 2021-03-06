# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi


# set PATH so it includes user's private bin directories
PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/bin:$HOME/scripts"
export PATH="$HOME/.cargo/bin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

# remap CapsLock -> CTRL:
setxkbmap -option ctrl:nocaps

at now + 2 hours -f scripts/at/work_break
at now + 4 hours -f scripts/at/work_break
at now + 6 hours -f scripts/at/work_break
at now + 8 hours -f scripts/at/work_break
