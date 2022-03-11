# chezmoi completions
eval "$(chezmoi completion bash)"

# make less more awesome
export LESS="-FRX"

# vim as default editor on the command line
export EDITOR=vim

# KILL XON AND XOFF, seriously.
stty stop undef start undef

# kill command-not-found
unset command_not_found_handle
