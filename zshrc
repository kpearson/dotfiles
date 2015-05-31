# ________Load Alieses/Functions__________
# export PATH="$HOME/.dotfiles/bin:$PATH"

# ________ Load ZSH-Completions __________
fpath=(/usr/local/share/zsh-completions $fpath)

# _____________Git Prompt_________________
source ~/configure/zsh-git-prompt/zshrc.sh
PROMPT='%B%~%b$(git_super_status) %# '

# ________________rbenv____________________
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ______________go lang gvm________________
[[ -s "/Users/Kit/.gvm/scripts/gvm" ]] && source "/Users/Kit/.gvm/scripts/gvm"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# ____________Default Editor_______________
export EDITOR=vim

unsetopt beep
unsetopt hist_beep
unsetopt list_beep


# ________________Alias____________________
## LoadPath concerns are located in ~/.envrc
#  Managed by direnv info at https://github.com/zimbatm/direnv#the-stdlib
# eval "$(direnv hook $0)
# PROMPT='%B%m%~%b$(git_super_status) %# '
