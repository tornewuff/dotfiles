# Assume that path_abbrev is fully populated at this point;
# build up reverse mapping and create cd aliases.
unset path_abbrev_rev
declare -A path_abbrev_rev

for s in ${!path_abbrev[@]}; do
    path_abbrev_rev[${path_abbrev[$s]}]=$s
    alias ${s}="cd ${path_abbrev[$s]}"
done

# Here be dragons.
abbrev_path ()
{
    local in="$1" bestlen=0 len=0 try="" prefix="" maxlen=${2:-0}
    local begin="" shortbegin="" end="${in#/}" current=""
    for prefix in ${!path_abbrev_rev[@]}; do
        len=${#prefix}
        if [ $len -gt $bestlen ]; then
            try="${in#${prefix}/}"
            if [ "$in" == "$prefix" ]; then
                bestlen=$len
                begin="$prefix"
                shortbegin="${path_abbrev_rev[$prefix]}"
                end=""
            elif [ "$in" != "$try" ]; then
                bestlen=$len
                begin="$prefix"
                shortbegin="${path_abbrev_rev[$prefix]}"
                end="$try"
            fi
        fi
    done

    local shortenedpath="${shortbegin}/${end}" shortcur="" i=0
    local subcurrent="" matching=()
    while [ "$end" -a ${#shortenedpath} -gt $maxlen ]; do
        current="${end%%/*}"
        end="${end#$current}"
        end="${end#/}"
        shortcur="$current"
        for ((i=${#current}-2; i>=0; i--)); do
            subcurrent="${current:0:i}"
            matching=("$begin/$subcurrent"*/)
            if [ ${#matching[*]} -ne 1 ]; then
                break
            fi
            shortcur="$subcurrent*"
        done
        begin="$begin/$current"
        shortbegin="$shortbegin/$shortcur"
        shortenedpath="$shortbegin/$end"
    done

    echo -n "${shortenedpath%/}"
}
