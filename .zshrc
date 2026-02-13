# load compinit for completion system
autoload -Uz compinit && compinit

# load vcs_info for loading repository statuses
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# PROMPT_SUBST is required by vcs_info
setopt PROMPT_SUBST

# vi mode
bindkey -v

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

# Prompt base
PROMPT_BASE='%{%F{34}%}%n%{%F{40}%}@%{%F{46}%}%m %{%F{229}%}%1~ %{%F{220}%}<placeholder> %{%f%}$ '

# if is root change it to another color
[[ "$UID" == 0 || "$EUID" == 0 ]] && \
    PROMPT_BASE="%{%F{196}%}%n%{%F{202}%}@%{%F{208}%}%m %{%F{229}%}%1~ <placeholder> %{%F{196}%}# %{%f%}"

# prompt with vcs_info
export PROMPT=$(echo -n "$PROMPT_BASE" | sed 's/<placeholder>/${vcs_info_msg_0_}/')

# define nvim as default editor and alias vim command
export EDITOR=nvim
export PATH=$PATH:~/.config/composer/vendor/bin:~/go/bin
export BAT_THEME="zenburn"

# Change cursor shape for different vi modes
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

# source fzf if exists
[[ -f /usr/bin/fzf ]] && source <(fzf --zsh)

# source autosuggestions if exists
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# source syntax-highlighting if exits
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source completions if exists
[[ -f /usr/share/zsh/plugins/zsh-completions/zsh-completions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-completions/zsh-completions.zsh && \
    source <(kubectl completion zsh)

# connect to ssh with vi mode and clear screen binding, example: s user@host
function s() {
    TERM=xterm-256color ssh "$@" -t "export EDITOR=vi; bash -i -c 'bind \"\\C-l\":clear; bash -o vi'"
}

# use yazi by pressing y to change directory and update cwd
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# rename zellij tab by current directory
# https://www.reddit.com/r/zellij/comments/10skez0/does_zellij_support_changing_tabs_name_according/
zellij_tab_name_update() {
    if [[ -n $ZELLIJ ]]; then
        local current_dir=$PWD
        if [[ $current_dir == $HOME ]]; then
            current_dir="~"
        else
            current_dir=${current_dir##*/}
        fi
        command nohup zellij action rename-tab $current_dir >/dev/null 2>&1
        command nohup zellij action rename-pane $current_dir >/dev/null 2>&1
    fi
}

# my aliases
alias dc='docker compose'
alias k=kubectl
alias l='ls -F'
alias ls=eza
alias grep='grep --color'
alias g=git
alias vim=nvim
alias mpa='mpv --no-video'
alias vcc='nvim +CodeCompanionChat +only'
alias gemini='docker run --rm -it -v ~/.gemini-home:/home/node gemini gemini'
alias geminithis='docker run --rm -it -v ~/.gemini-home:/home/node -v ./:/home/node/output gemini gemini'
alias minikubestart='minikube start && minikube addons enable ingress && minikube addons enable metrics-server && kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.31/deploy/local-path-storage.yaml'

# call update zellij tab name when directory are changed
zellij_tab_name_update
chpwd_functions+=(zellij_tab_name_update)
