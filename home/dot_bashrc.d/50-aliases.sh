# misc shell aliases/functions

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

gitfind ()
{
    git ls-files -- $(git rev-parse --show-cdup) | grep $1
}

gvimfind ()
{
    gvim $(gitfind $1)
}

gvimgrep ()
{
    gvim $(git grep -l "$@")
}

svngrep () {
    find \! \( -type d -name .svn -prune \) -a -type f -print0 | xargs -0 grep "$@"
}
