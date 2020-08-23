# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_MODE="awesome-patched"

#source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH='/Users/siya/Library/Python/3.7/bin':$PATH
#powerline-daemon -q
#. '/Users/siya/Library/Python/3.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh'
