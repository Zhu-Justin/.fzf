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

if [[ $(uname) == "Darwin" ]]; then
	# dirname on OS X behaves funky, get gdirname via
	# brew install coreutils
	export dirname_command="gdirname"
else
	export dirname_command="dirname"
fi

export FZF_COMPLETION_TRIGGER="**"
export FZF_DEFAULT_COMMAND="rg --files --sortr modified"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--preview-window=:hidden"
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 "$dirname_command" | uniq"
# export FZF_ALT_C_OPTS="--preview-window=:hidden"
# # export FZF_DEFAULT_COMMAND="find . 
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

# _fzf_complete_vi() {
#   _fzf_complete
# }

_fzf_complete_doge() {
  _fzf_complete --multi --reverse --prompt="doge> " -- "$@" < <(
    echo very
    echo wow
    echo such
    echo doge
  )
}

# if ! declare -f _fzf_compgen_path > /dev/null; then
_fzf_compgen_path() {
	rg --files --sortr modified
}
_fzf_compgen_dir() {
	# rg --sort-files --files --null 2> /dev/null | xargs -0 "$dirname_command" | uniq
    # fd --type d . "$1"
}
# fi
# if ! declare -f _fzf_compgen_path > /dev/null; then
#   _fzf_compgen_path() {
#     echo "$1"
#     command find -L "$1" \
#       -name .git -prune -o -name .hg -prune -o -name .svn -prune -o \( -type d -o -type f -o -type l \) \
#       -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
#   }
# fi
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
# export FZF_COMPLETION_TRIGGER=""
# FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
#
#

 # FORGIT_FZF_DEFAULT_OPTS="
# --exact
 # --border
 # --cycle
 # --reverse
 # --height '80%'
 # --bind 'ctrl-l:execute(echo {+} | xargs -o less)'
 # "
 
# --bind="ctrl-l:execute(echo {} |grep -Eo [a-f0-9]+ |head -1 |xargs git show |less -)"
# export FORGIT_LOG_FZF_OPTS='
# --bind="ctrl-l:execute($cmd | LESS='-r' less)"
# '
