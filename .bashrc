# Check for an interactive session
[ -z "$PS1" ] && return

### respect CentOS7 default settings
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/.bashrc.alias
