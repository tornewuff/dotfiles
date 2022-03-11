# Short path mapping magic. Put your short paths in this array.
unset path_abbrev
declare -A path_abbrev

path_abbrev['~']="$HOME"
