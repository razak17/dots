SERVER="Main"
HOME="/home/razak"
DEV=$HOME/Dev
X="tmux -L ${SERVER}"
MONEYPORTAL=$DEV/Code/projects/money-portal
WEBSITE="$DEV/Code/website"
V1="$DEV/Code/web/v1"
CC=$DEV/Code/coding_challenges
DEMOS=$DEV/Code/demos
DS=$DEV/Code/ds_and_algos
SCRIPTS=$DEV/Scripts
NVIM=$HOME/.config/nvim
C_NVIM=$HOME/.cache/nvim
DOCS=/run/media/razak/55CD-9C80/Portable/Documents/Docs

getPaneId() {
  tag=$1
  sessionOrWindowId=$2
  if [[ "$tag" == "-p" ]]; then
    paneId=$($X display -p '#{pane_id}')
  elif [[ "$tag" == "-s" ]]; then
    paneId=$($X list-panes -s -F '#D' -t $sessionOrWindowId)
  elif [[ "$tag" == "-w" ]]; then
    paneId=$($X list-panes -F '#D' -t $sessionOrWindowId)
  elif [[ "$tag" == "-a" ]]; then
    paneId=$($X list-panes -a -F '#D')
  fi
  echo $paneId
}

getWindowId() {
  tag=$1
  session=$2
  if [[ "$tag" == "-s" ]]; then
    windowIds=$($X list-windows -F '#{window_id}' -t $session)
  elif [[ "$tag" == "-a" ]]; then
    windowIds=$($X list-windows -a -F '#{window_id}')
  fi
  echo $windowIds
}

panesList() {
  tag=$1
  session=$2
  if [[ "$tag" == "-a" ]]; then
    panes=$($X list-panes -a -F '#D')
  elif [[ "$tag" == "-w" ]]; then
    panes=$($X list-panes -F '#D')
  elif [[ "$tag" == "-s" ]]; then
    panes=$($X list-panes -s -F '#D' -t $session)
  fi
  echo $panes
}

splitPane() {
  split=$1
  shift
  cmd="$X splitw"
  if [[ "$split" == "-v" ]]; then
    cmd="$cmd -h $@"
  elif [[ "$split" == "-h" ]]; then
    cmd="$cmd -v $@"
  fi
  eval $cmd
}

getTarget() {
  target=$1
  id=$2
  shift
  shift
  if [[ $# -gt 0 ]]; then
    if [[ "$@" == "-w" ]]; then
      cmd=$(getWindowId -s $target)
    elif [[ "$@" == "-p" ]]; then
      cmd=$(getPaneId -w $target)
    fi
  fi
  IFS=' ' read -ra ids <<< "$cmd"
  echo "${ids[$id]}"
}

resizePane() {
  active=$($X display -p -F '#{pane_id}')
  # echo $active
  cmd="$X resizep -x 50% -y 50%"
  eval $cmd
}

createSession() {
  session=$1
  window=$2
  hasSession=$($X list-sessions | grep $session)
  shift
  shift

  if [[ -z "$hasSession" ]]; then
    if [[ "$#" -gt 0 ]]; then
      cmd="$X new -s $session -d -c$@ -n $window > /dev/null 2>&1"
    else
      cmd="$X new -s $session -d -n $window > /dev/null 2>&1"
    fi
    eval $cmd
  else
    echo duplicate session: $session
  fi

}

createWindow() {
  session=$1
  window=$2
  shift
  shift
  hasWindow=$($X list-windows -t $session | grep "$window")
  if [[ -z "$hasWindow" ]]; then
    cmd="$X neww -t $session: -n $window -d $@"
    eval $cmd
  else
    echo duplicate window: $window
  fi
}

while [[ "$#" -gt 0 ]]; do
  curr=$1
  shift

  case "$curr" in
  "-h")
    echo -h: help
    echo -r: resize
    echo -a: send \"zs\" to all panes
    echo -m: moneyportal
    echo -s: create session. followed by \"-session-name\".
    echo -w: website
    echo -n: regular sessions. followed by \"-name\".
    echo -name:
    echo "    -c: coding_challenges"
    echo "    -d: demos"
    echo "    -ds: ds_and_algos"
    echo "    -m: m_"
    echo "    -s: scripts"
    echo -cmd:
    echo -c: regular commands. followed by \"-cmd\".
    echo "    -w: window name"
    ;;
  "-c")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    case "$arg" in
    "-p")
      $($X run-shell -b 'echo pane id is #{pane_id}')
      ;;
    "-pt")
      $($X run-shell -b 'echo pane title is #{pane_title}')
      ;;
    "-w")
      $($X run-shell -b 'echo window name is #{window_name}')
      ;;
    *) echo "Unavailable command... $arg"
  esac
  ;;
  "-r")
    resizePane
    ;;
  "-ap")
    OUTPUT=$(pwd)
    echo pwd: "${OUTPUT}"
    ;;
  "-a")
    panes=$(panesList -a)
    IFS=' ' read -ra ids <<< "$panes"
    for i in ${panes[@]}; do
      $X send-keys -t $i "zs" "C-m"
    done
    ;;
  "-s")
    session=$1
    if [[ -z $session ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    createSession $session "main"
    ;;
  "-z")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-a should have the next argument contain actual command"
      exit 1
    fi
    shift
    echo YAY $arg
    ;;
  "-m")
    session="money-portal"
    createSession $session "code" $MONEYPORTAL
    createWindow $session "run" -c $MONEYPORTAL/web
    createWindow $session "psql-redis" -c $MONEYPORTAL/server
    createWindow $session "docker-azure" -c $MONEYPORTAL/server

    # First Window
    tw=$(getTarget $session 0 -w)
    $X send-keys -t $(getTarget $tw 0 -p) "nvim" "C-m"

    # Second Window
    tw=$(getTarget $session 1 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "yarn --help" "C-m"
    splitPane -v -c $MONEYPORTAL/server -t $first
    second=$(getTarget $tw 1 -p)
    $X send-keys -t $second "yarn --help" "C-m"
    splitPane -h -c $MONEYPORTAL/server -t $second
    third=$(getTarget $tw 2 -p)
    $X send-keys -t $third "yarn --help" "C-m"

    # Third Window
    tw=$(getTarget $session 2 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "psql -U postgres" "C-m"
    splitPane -v -c $MONEYPORTAL/server -t $first
    second=$(getTarget $tw -1 -p)
    $X send-keys -t $second "redis-cli ping" "C-m"

    # Fourth Window
    tw=$(getTarget $session 3 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "docker info" "C-m"
    splitPane -v -c $MONEYPORTAL/server -t $first
    $X send-keys -t $(getTarget $tw -1 -p) "docker info" "C-m"
    ;;
  "-w")
    session="website"
    createSession $session "code" $WEBSITE
    createWindow $session "run" -c $WEBSITE
    createWindow $session "v1" -c $V1

    # First Window
    tw=$(getTarget $session 0 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "nv src/pages/index.tsx" "C-m"

    # Second Window
    tw=$(getTarget $session 1 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "git status" "C-m"
    splitPane -v -c $WEBSITE -t $first
    second=$(getTarget $tw 1 -p)
    # $X send-keys -t $second "npm run develop" "C-m"
    splitPane -h -c $WEBSITE -t $second
    third=$(getTarget $tw 2 -p)
    $X send-keys -t $third "cdocs" "C-m"

    # Third Window
    tw=$(getTarget $session 2 -w)
    first=$(getTarget $tw 0 -p)
    $X send-keys -t $first "nv src/pages/index.js" "C-m"
    ;;

  "-n")
    arg=$1
    if [[ -z $arg ]]; then
      echo "-n should have the next argument contain actual session"
      exit 1
    fi
    shift
    case "$arg" in
    "-c")
      session="coding_challenges"
      createSession $session main $CC
      tw=$(getTarget $session 0 -w)
      first=$(getTarget $tw 0 -p)
      splitPane -v -c $CC -t $first
      ;;
    "-d")
      session="demos"
      createSession $session main $DEMOS
      tw=$(getTarget $session 0 -w)
      first=$(getTarget $tw 0 -p)
      splitPane -v -c $DEMOS -t $first
      ;;
    "-ds")
      session="ds_and_algos"
      createSession $session main $DS
      tw=$(getTarget $session 0 -w)
      first=$(getTarget $tw 0 -p)
      splitPane -v -c $DS -t $first
      ;;
    "-m")
      session="m_"
      createSession $session main $C_NVIM
      createWindow $session "init" -c $NVIM
      tw=$(getTarget $session 0 -w)
      first=$(getTarget $tw 0 -p)
      splitPane -v -c $DOCS -t $first
      ;;
    "-s")
      session="scripts"
      createSession $session main $SCRIPTS
      tw=$(getTarget $session 0 -w)
      first=$(getTarget $tw 0 -p)
      splitPane -v -c $SCRIPTS -t $first
      ;;
    *) echo "Unavailable command... $arg"
    esac
    ;;
  *) echo "Unavailable command... $curr"
  esac
done
