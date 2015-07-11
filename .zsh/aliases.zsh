# ls
# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -ahF --color=auto' 

# Same as above, but in long listing format
alias ll='ls -lahF --group-directories-first --color=auto'

# grep
# Colorize output
alias grep='grep --color=auto'

# du
# show size of current folder and sort it
alias size='du -sh * | sort -hr'
