# everything is in ~/.profile.d

[ -n "$PROFILE_ALREADY_SOURCED" ] && return
export PROFILE_ALREADY_SOURCED=1

for f in ~/.profile.d/*.sh; do
  . $f
done
