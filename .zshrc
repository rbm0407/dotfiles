autoload -Uz compinit
compinit

bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=999999

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh

alias vim=nvim
alias ls=eza
alias grep='grep --color'

# https://robotmoon.com/zsh-prompt-generator/
#export PS1="%{%F{7}%}%n%{%F{81}%}@%{%F{80}%}%m %{%F{33}%}%1~ %{%f%}$ "
export PS1="%{%F{7}%}%n%{%F{81}%} %{%F{33}%}%1~ %{%f%}$ "
export EDITOR=nvim

source <(kubectl completion zsh)
