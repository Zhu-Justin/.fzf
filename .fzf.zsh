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

export FZF_DEFAULT_COMMAND="rg --files --sortr modified"

# export FZF_DEFAULT_COMMAND="find . 
# -not -path '*/[@.]*'
# -o -name .git -prune 
# -o -name node_modules -prune 
# -o -name coverage -prune 
# -o -name tmp -prune 
# -o -type f -print"

# export FZF_DEFAULT_COMMAND="find . -name .git -prune -o -name node_modules -prune -o -name coverage -prune -o -name tmp -prune -not -path '*/[@.]*' -type f -print"


# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,Downloads,Music,Movies,A} --type f"

# export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -name node_modules -prune -o -name coverage -prune -o -name tmp -prune -type f -print'

export FZF_DEFAULT_OPTS="
--height=80%
--multi
--layout=reverse
--preview '([[ -f {} ]] && (cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind '?:toggle-preview'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
"

# --layout=reverse
# --info=inline
# --height=80%
# --multi
# --preview-window=:hidden
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
# --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'

# --bind 'ctrl-a:select-all'

# FZF_DEFAULT_COMMAND="find --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

# FZF_DEFAULT_COMMAND="find ."
# export FZF_COMPLETION_TRIGGER="**"
# export FZF_COMPLETION_TRIGGER=""
# FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq".
# FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
