#export SSH_AUTH_SOCK=$TMPDIR/ssh-agent-$USER.sock
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias vm="cd /Users/xiaoya_wei/airlab && vagrant up && vagrant ssh"
alias vh="cd /Users/xiaoya_wei/airlab && vagrant halt"
alias v="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

alias grep='grep -i --color=auto'
alias egrep='egrep -i --color=auto'
alias fgrep='fgrep -i --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gpr='git pull --rebase'
alias gcm='git checkout master'
alias gc='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias grm='git rebase master'
alias gp='git push'
alias gpf='git push -f'
alias gs='git status'
alias gsh='git show'
alias ga='git add .'
alias gca='git commit --amend --no-edit'
alias grm='git rebase master'
alias grc='git rebase --continue'
alias gclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

alias el='/Users/xiaoya_wei/repos/airbnb/node_modules/.bin/eslint'

alias less='less -R'
alias more='more -R'

alias gk='yk'

alias headlamp='ssh -v -N -L 9200:localhost:9200 i-db257052.inst.aws.airbnb.com'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo erro    r)"
"$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
    ag -C 3 -i --ruby --js --sass --color-match "1;31" --color-line-number "39" $1
  else
    ag -C 3 -i --color-match "1;31" --color-line-number "39" $2 $1
  fi
}
alias sh1='ssh gw1.silver.musta.ch'
alias sr1='ssh rc1.musta.ch'

export NVM_DIR="/Users/xiaoya_wei/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/sbin:$PATH"
