# define homeshick alias and completion
source ~/.homesick/repos/homeshick/homeshick.sh
source ~/.homesick/repos/homeshick/completions/homeshick-completion.bash

# check for homeshick freshness
homeshick --quiet refresh

# make less more awesome
export LESS="-FRX"

# vim as default editor on the command line
export EDITOR=vim

# KILL XON AND XOFF, seriously.
stty stop undef start undef

# kill command-not-found
unset command_not_found_handle
