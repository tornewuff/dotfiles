# everything is in ~/.profile.d

for f in ~/.profile.d/*.sh; do
  . $f
done
