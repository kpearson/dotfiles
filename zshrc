# ____________Load Alieses_________________
export PATH="$HOME/.dotfiles/bin:$PATH"

 #______________Git Prompt_________________
source ~/configure/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# ______________Compinstall_________________
# tab complition (works with aliases)
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall

### End of lines added by compinstall

# ________________rbenv____________________
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# _____________go lang gvm_______________
[[ -s "/Users/Kit/.gvm/scripts/gvm" ]] && source "/Users/Kit/.gvm/scripts/gvm"

# git-browse
export PATH=$PATH:~/Library/git-browse/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# ____________Default Editor_______________
export EDITOR=vim

# ________________Alias____________________
## LoadPath concerns are located in ~/.envrc
#  Managed by direnv info at https://github.com/zimbatm/direnv#the-stdlib
# eval "$(direnv hook $0)
# PROMPT='%B%m%~%b$(git_super_status) %# '
