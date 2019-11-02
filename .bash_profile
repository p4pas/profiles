# set up PS1 with nice colors etc
__prompt_command() {
  local EXIT="$?"           # This needs to be first

  local USER="${debian_chroot:+($debian_chroot)}\u"
  local PROMPT="\\$"

	local	RS="\[\033[0m\]"    # reset
	local	UL="\[\033[4m\]"    # underline
	local	FRED="\[\033[31m\]" # foreground red
	local	FGRN="\[\033[32m\]" # foreground green
	local	FBLE="\[\033[34m\]" # foreground blue
	local	BRED="\[\033[41m\]" # background red

  if [ $EXIT = 0 ]; then
      PS1="${FGRN}+${RS} "
  else
      PS1="${BRED}x${RS} "
  fi

  PS1+="[${FBLE}${UL}${USER}${RS}@${FRED}\h${RS}: \W ${PROMPT}] " # Set prompt
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h\a\]$PS1"    # Set title
}

PROMPT_COMMAND=__prompt_command
