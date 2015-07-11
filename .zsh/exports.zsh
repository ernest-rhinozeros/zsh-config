# add .bin to path
# custom scripts
export PATH=$PATH:$HOME/.bin

# add $JOHN variable
export JOHN=$HOME/tools/john/run

# maven3 home
export M2_HOME=$HOME/tools/maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms1024m -Xmx4096m"
export PATH=$PATH:$M2
export MAVEN_COLOR=true

# node js
export NODE_HOME=$HOME/tools/node-v0.12.2-linux-x64
export PATH=$PATH:$NODE_HOME/bin

# initialize z
# https://github.com/rupa/z
. ~/tools/z/z.sh

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# ... also for less
export LESS='--ignore-case --raw-control-chars'
