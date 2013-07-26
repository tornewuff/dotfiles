# Actually create a new screen if we are supposed to be doing that.
if [ -n "$CREATE_SCREEN_LATER" ]; then
  exec screen -S $SCREEN_SESSION -U
fi
