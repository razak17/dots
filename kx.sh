db=/home/razak/Dev/Scripts/rescache/system32.kdbx
keyfile=/home/razak/Dev/Scripts/rescache/scanerr

while [[ "$#" -gt 0 ]]; do
  curr=$1
  shift

  case "$curr" in
  "-h")
    echo "valid commands:"
    echo "-loc <arg>: locate"
    echo "-show <arg>: show"
    echo "-user <arg>: copy username"
    echo "-pass <arg>: copy password"
  ;;
  "-loc")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    keepassxc-cli locate -q -k ${keyfile} ${db} $arg
  ;;
  "-show")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    keepassxc-cli show -q -k ${keyfile} ${db} $arg
  ;;
  "-user")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    keepassxc-cli clip -q -k ${keyfile} -a username ${db} $arg 30
  ;;
  "-pass")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    keepassxc-cli clip -q -k ${keyfile} ${db} $arg 30
  ;;
  *) echo "Unavailable command... $curr"
  esac
done
