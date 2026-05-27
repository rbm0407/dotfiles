### export variables

export EDITOR=nvim
export PATH="$HOME/go/bin:$PATH"
export BAT_THEME="zenburn"


#### load compinit for completion system
autoload -Uz compinit && compinit


### vi mode
bindkey -v


### prompt colors with git info

# prompt base
PROMPT_BASE='%{%F{34}%}%n%{%F{40}%}@%{%F{46}%}%m %{%F{229}%}%1~ %{%F{220}%}<placeholder> %{%f%}$ '

# load vcs_info for loading repository statuses
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '%b'
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# if is root change it to another color
[[ "$UID" == 0 || "$EUID" == 0 ]] && \
    PROMPT_BASE="%{%F{196}%}%n%{%F{202}%}@%{%F{208}%}%m %{%F{229}%}%1~ <placeholder> %{%F{196}%}# %{%f%}"

# prompt with vcs_info
PROMPT=${PROMPT_BASE//<placeholder>/'${vcs_info_msg_0_}'}

# PROMPT_SUBST is required by vcs_info
setopt PROMPT_SUBST


### history settings

# history options
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



### change cursor shape for different vi modes

function zle-keymap-select () {
  if [[ ${KEYMAP} == vicmd ]]; then
    # blinking block cursor in command mode
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main || ${KEYMAP} == viins ]]; then
    # blinking pipe cursor in insert mode
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Set the initial cursor to a pipe when the shell starts
zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init


### source plugins

# source fzf if exists
(( $+commands[fzf] )) && source <(fzf --zsh)

# source autosuggestions if exists
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# source syntax-highlighting if exits
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# kubectl source completions if is installed
(( $+commands[kubectl] )) && source <(kubectl completion zsh)

# rbw source completions if is installed
(( $+commands[rbw] )) && source <(rbw gen-completions zsh)

# connect to ssh with vi mode and clear screen binding, example: s user@host
function s() {
    TERM=xterm-256color ssh "$@" -t "export EDITOR=vi; bash -i -c 'bind \"\\C-l\":clear; bash -o vi'"
}


### my custom bindings

# open lfcd with CTRL+O
bindkey -s '^o' 'lfcd\n'


### my aliases

alias dc='podman-compose'
alias k=kubectl
alias ls=eza
alias l='eza -F'
alias grep='grep --color'
alias mpa='mpv --no-video'
alias minikubestart='minikube start && minikube addons enable metrics-server && kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.35/deploy/local-path-storage.yaml'
alias vim=nvim
