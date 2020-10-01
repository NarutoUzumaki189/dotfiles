# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_MODE="awesome-patched"

#
#source $ZSH/oh-my-zsh.sh
# Enable colors and change prompt:
autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/code/(portal|portal-ee|portal-master)(|/*)"
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:hg*:*' formats '[%m%b] '
zstyle ':vcs_info:hg*:*' actionformats '[%b|%a%m] '
zstyle ':vcs_info:hg*:*' branchformat '%b'
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' get-revision true
zstyle ':vcs_info:hg*:*' get-mq false
zstyle ':vcs_info:hg*+gen-hg-bookmark-string:*' hooks hg-bookmarks
zstyle ':vcs_info:hg*+set-message:*' hooks hg-message

function +vi-hg-bookmarks() {
  emulate -L zsh
  if [[ -n "${hook_com[hg-active-bookmark]}" ]]; then
    hook_com[hg-bookmark-string]="${(Mj:,:)@}"
    ret=1
  fi
}

function +vi-hg-message() {
  emulate -L zsh

  # Suppress hg branch display if we can display a bookmark instead.
  if [[ -n "${hook_com[misc]}" ]]; then
    hook_com[branch]=''
  fi
  return 0
}

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}●%f"
  fi
}
precmd() {
    vcs_info
}
setopt PROMPT_SUBST
RPROMPT_BASE='${vcs_info_msg_0_}'

export RPROMPT=$RPROMPT_BASE
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH='/Users/siya/Library/Python/3.7/bin':$PATH
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#powerline-daemon -q
#. '/Users/siya/Library/Python/3.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh'
