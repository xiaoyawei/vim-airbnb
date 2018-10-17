#export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ap="cd /Users/xiaoya_wei/airlab && airlab provision"
alias v="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F -G'
  eval `gdircolors -b $HOME/.dir_colors`
fi

alias grep='grep -i --color=auto'
alias egrep='egrep -i --color=auto'
alias fgrep='fgrep -i --color=auto'

alias ll='ls -alFG'
alias la='ls -A --color'
alias l='ls -CF --color'

alias gpr='git pull --rebase'
alias gcm='git checkout master'
alias gcp='git checkout production'
alias gc='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias grm='git rebase master'
alias grp='git rebase production'
alias gp='git push'
alias gpf='git push -f'
alias gs='git status'
alias gsh='git show'
alias ga='git add .'
alias gca='git commit --amend --no-edit'
alias grc='git rebase --continue'
alias gclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias gt='touch GIT_CHECKOUT_PATHS'

alias nr='npm run'

alias less='less -R'
alias more='more -R'

alias gk='yk'

alias headlamp='ssh -v -N -L 9200:localhost:9200  i-36d0df85.inst.aws.airbnb.com'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo erro    r)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# auto completion for git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

g(){
  if [ -z $2 ]
  then
    ag -C 3 -i --ruby --js --sass --java --python --color-match "1;31" --color-line-number "39" $1
  elif [ $2 = "--all" ]
  then
    ag -C 3 -i --color-match "1;31" --color-line-number "39" $1
  else
    ag -C 3 -i --color-match "1;31" --color-line-number "39" $2 $1
  fi
}
alias sh1='ssh gw1.silver.musta.ch'
alias sr1='ssh rc1.musta.ch'

alias ss='sudo pkill -l socat'
alias ash='cd /Users/xiaoya_wei/airlab && airlab ssh'
alias asn='cd /Users/xiaoya_wei/airlab && airlab sync'

alias gfl='git diff --name-only HEAD HEAD^'

export NVM_DIR="/Users/xiaoya_wei/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/sbin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

alias gradle="$HOME/airlab/repos/treehouse/gradlew"

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}

alias mame='cd /Users/xiaoya_wei/mame && ./mame64 -cheat'

alias gradlew='/Users/xiaoya_wei/repos/treehouse/gradlew'

s(){
  ssh $1.inst.aws.airbnb.com
}

push(){
  scp /Users/xiaoya_wei/repos/treehouse/projects/trips/$1/build/libs/$1-all.jar xiaoya_wei@$2.inst.aws.airbnb.com:./matcha.jar
}

tunnel(){
  ssh -L $2:localhost:$2 $(optica role=$1 | head -1)
}

# afdev
export DATA_DIR=$HOME/repos/data #PATH WHERE YOU CLONED THE DATA REPO
export AFDEV_HOST="i-0a55744d91bc4533a.inst.aws.airbnb.com" #CHOOSE A DIFFERENT HOST
export AFDEV_PORT=63185 #CHOOSE A DIFFERENT PORT

alias estest='ssh -L 9200:localhost:9200 -L 9300:localhost:9300 $(optica role=wharf-elasticsearch-test-master$ | head -1)'
alias esprod='ssh -L 9200:localhost:9200 -L 9300:localhost:9300 $(optica role=wharf-elasticsearch-i3-master$ | head -1)'
