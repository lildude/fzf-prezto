zstyle -s ':prezto:module:fzf' fzf-base FZF_BASE
if [ ! -z "$FZF_BASE" ]; then
  export FZF_BASE
fi

zstyle -s ':prezto:module:fzf' fzf-default-command FZF_DEFAULT_COMMAND
if [ ! -z "$FZF_DEFAULT_COMMAND" ]; then
  export FZF_DEFAULT_COMMAND
fi

if zstyle -t ':prezto:module:fzf' disable-key-bindings 'yes'; then
  export DISABLE_FZF_KEY_BINDINGS="true"
fi

if zstyle -t ':prezto:module:fzf' disable-completion 'yes'; then
  export DISABLE_FZF_AUTO_COMPLETION="true"
fi

source "${0:h}/fzf.plugin.zsh"

export FZF_DEFAULT_OPTS=""

# Set order
if zstyle -t ':prezto:module:fzf' reverse 'yes'; then
  export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --reverse"
fi

# Set preview
if zstyle -t ':prezto:module:fzf' preview 'yes'; then
  # Use preview window with Ctrl-T
  export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
  # If tree command is installed, show directory contents in preview pane when use Alt-C
  if (( $+commands[tree] )); then
	export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
  fi
fi

# Set height of fzf results
zstyle -s ':prezto:module:fzf' height FZF_HEIGHT

# Open fzf in a tmux pane if using tmux
if zstyle -t ':prezto:module:fzf' tmux && [ -n "$TMUX_PANE" ]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=${FZF_HEIGHT:-40%}
  alias fzf="fzf-tmux -d${FZF_TMUX_HEIGHT}"
else
  export FZF_TMUX=0
  if [ ! -z "$FZF_HEIGHT" ]; then
    export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_HEIGHT}"
  fi
fi

# Set colors defined by user
source "${0:h}/colors.zsh"
zstyle -s ':prezto:module:fzf' color-scheme FZF_COLOR
if [[ ! -z "$FZF_COLOR" && ${fzf_colors["$FZF_COLOR"]} ]]; then
  export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color ${fzf_colors["$FZF_COLOR"]}"
fi


