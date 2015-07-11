# -------------------------------------------------------------------
# finds subdirectories a <level> depth
# -------------------------------------------------------------------
function flevel() {
  if [ $# -gt 0 ] ; then
    find `pwd` -mindepth $1 -maxdepth $1 -type d
  else
    echo "Usage: $0 LEVEL"
    echo ""
    echo "LEVEL is the depth of the subdirectories you want to view"
    echo "$0 is an alias for:"
    echo "  find \`pwd\` -mindepth \$1 -maxdepth \$1 -type d"
  fi
}

# -------------------------------------------------------------------
# list the status of all hg repositories inside a subdirectory
# -------------------------------------------------------------------
function hglist() {
  if [ $# -gt 0 ] ; then
    while [[ -n $1 ]]; do
      
      pwd=`pwd`
      cd $1 && hg promp --angle-brackets "$fg_bold[yellow]<status|modified>$reset_color$fg_bold[red]<status|unknown>$reset_color$fg[red]<update>$reset_color `pwd`
" 2>/dev/null
      cd $pwd
      
      shift
    done
  fi
}

function hgmerc() {
  pwd=`pwd`
  cd $HOME/mercurial
  hglist `flevel 2`
  cd $pwd
}

function mvd() {
  if [ $# -eq 2 ] ; then
    mkdir -p $2
    mv $1 $2
  else
    mv
  fi
}

# -------------------------------------------------------------------
# compressed file expander 
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
function ex {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)	tar xjf $1		;;
          *.tar.gz)		tar xzf $1		;;
          *.tar.xz)		tar Jxf $1		;;
          *.bz2)		  bunzip2 $1		;;
          *.rar)		  unrar x $1		;;
          *.gz)			  gunzip $1		  ;;
          *.tar)		  tar xf $1		  ;;
          *.tbz2)		  tar xjf $1		;;
          *.tgz)		  tar xzf $1		;;
          *.zip)		  unzip $1		  ;;
          *.Z)			  uncompress $1	;;
          *.7z)			  7z x $1			  ;;
          *)          echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

# -------------------------------------------------------------------
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
# -------------------------------------------------------------------
function nicemount() { 
  (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; 
}

# -------------------------------------------------------------------
# myIP address
# -------------------------------------------------------------------
function myip() {
  ifconfig lo   | grep 'inet '  | sed -e 's/:/ /' | awk '{print "lo         : " $2}'
  ifconfig eth0 | grep 'inet '  | sed -e 's/:/ /' | awk '{print "eth0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig eth0 | grep 'inet6 ' | sed -e 's/:/ /' | awk '{print "eth0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# -------------------------------------------------------------------
# make python file more pythonic (PEP 8)
# (from https://stackoverflow.com/questions/23607374/python-how-to-batch-rename-mixed-case-to-lower-case-with-underscores)
# -------------------------------------------------------------------
function pepify() {
  echo Hello World
  if [ -f $1 ] ; then
    REGEX='s/(^|[^A-Za-z_])([a-z0-9_]+)([A-Z])([A-Za-z0-9_]*)([^A-Za-z0-9_]|$)/\1\2_\l\3\4\5/'
    case $1 in
      *.py) sed -i -e :loop -re $REGEX -e 't loop' $1     ;;
      *)    echo "'$1' is not a python file" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# -------------------------------------------------------------------
# sort the content of all files in the current dir
# -------------------------------------------------------------------

function sortall() {
  if [ $# -gt 0 ] ; then
    for i in * ; do
      sort --parallel=4 -o $i $i ; 
    done
  else
    echo "Usage: $0 PATTERN"
    echo ""
    echo "PATTERN is the pattern the files you want to sort should match"
  fi
}
