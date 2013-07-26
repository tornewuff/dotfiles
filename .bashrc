# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# everything is in ~/.bashrc.d
for f in ~/.bashrc.d/*.sh; do
  source $f
done
