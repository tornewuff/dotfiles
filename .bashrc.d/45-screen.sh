# restore DISPLAY and SSH_AUTH_SOCK from those saved before entering screen
if [ -n "$STY" ]; then
  export DISPLAY=`cat ~/.current_display`
  export SSH_AUTH_SOCK=`cat ~/.current_ssh_auth_sock`
fi
