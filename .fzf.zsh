# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

export FZF_DEFAULT_OPTS="
--height=80%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vi)'
"

# --layout=reverse
# --info=inline
# --height=80%
# --multi
# --preview-window=:hidden
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'

# --bind 'ctrl-a:select-all'

# FZF_DEFAULT_COMMAND="find --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

# FZF_DEFAULT_COMMAND="find ."
# export FZF_COMPLETION_TRIGGER="**"
# FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
