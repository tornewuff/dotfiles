# torne: this is gross, build this up from parts!
SHELL_STATE=""
PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h \[\033[01;31m\]${SHELL_STATE}\[\033[01;34m\]$(abbrev_path "$PWD" 40)\[\033[00m\]\$ '
