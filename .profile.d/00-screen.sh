# MUST RUN FIRST
# when entering an already-existing screen we don't want to run the regular
# profile as it will do things like source .bashrc which we don't care about,
# and things like setting locale which we want to inherit from the client
# for proper charset translation.

# if running bash and not in POSIX mode (to give us a trapdoor via running sh)
# and we're connected to an SSH-owned TTY
if [ -n "$BASH_VERSION" -a -z "$POSIXLY_CORRECT" -a -n "$SSH_TTY" \
     -a "$SCREEN_SESSION" != "no" -a -x /usr/bin/screen ]; then
  # Save the 'real' DISPLAY and SSH_AUTH_SOCK we have been given from sshd
  # so we can reload them in .bashrc - this makes new shells do the 'right
  # thing' instead of inheriting them from the original screen process
  echo -n $DISPLAY > ~/.current_display
  echo -n $SSH_AUTH_SOCK > ~/.current_ssh_auth_sock

  # explicitly specified screen?
  if [ -z $SCREEN_SESSION ]; then
    SCREEN_SESSION="main"
  fi

  # check if we have a screen
  screen -S $SCREEN_SESSION -q -ls
  SCREENSTAT=$?
  if [ $SCREENSTAT -eq 11 ]; then
    # one session, resume without further environment foo
    # if there are more than one, screen seems to pick arbitrarily
    # but hey what are the odds of that
    exec screen -x -r $SCREEN_SESSION
  elif [ $SCREENSTAT -eq 9 ]; then
    # no session with that name
    # we will create it later after processing the rest of .profile.d
    CREATE_SCREEN_LATER=1
  elif [ $SCREENSTAT -eq 10 ]; then
    echo "Unattachable screen for some reason, which should never happen"
    echo "Fix it yourself."
  elif [ $SCREENSTAT -ge 12 ]; then
    echo "More than one screen?"
    echo "Fix it yourself."
  else
    echo "Screen returned some mystery error: $SCREENSTAT"
    echo "Fix it yourself."
  fi

  unset SCREENSTAT
fi
