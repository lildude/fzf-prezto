# fzf Module for Prezto

This plugin tries to find [junegunn's fzf](https://github.com/junegunn/fzf) based on where it has been installed, and enables its fuzzy auto-completion and key bindings, for use with the [Prezto](https://github.com/sorin-ionescu/prezto) ZSH configuration framework.

This plugin essentially adds Prezto `zstyle` configuration options to the [Oh My ZSH plugin](https://github.com/ohmyzsh/ohmyzsh/blob/95a06f3927a286db257dc99791b02caba757fe33/plugins/fzf/fzf.plugin.zsh) with inspiration drawn from <https://github.com/gpanders/fzf-prezto>.

## Installation

Prezto will load external modules found in the `$ZDOTDIR/.zprezto/contrib` directory so this is a good place to install this plugin:

```zsh
mkdir -p $ZDOTDIR/.zprezto/contrib
git submodule add -f https://github.com/lildude/fzf-prezto contrib/fzf
```

## Settings

Enable the plugin by adding `fzf` to the `zstyle ':prezto:load' pmodule` list in your `.preztorc` file.

You can then add the following configuration options to your `.preztorc` to customise the behaviour:

```zsh
# Forcefully Set to fzf installation directory path - default will try to detect the correct location
zstyle ':prezto:module:fzf' fzf-base '/path/to/fzf/install/dir'

# Set the default command to use when input is tty - default is to set it to these in the order in which they're found:
# - `rg --files --hidden --glob "!.git/*"`
# - `fd --type f --hidden --exclude .git`
# - `ag -l --hidden -g "" --ignore .git`,
zstyle ':prezto:module:fzf' fzf-default-command '<your fzf default commmand>'

# Disable keybindings - default: no
zstyle ':prezto:module:fzf' disable-key-bindings 'yes'

# Disable completion - default: no
zstyle ':prezto:module:fzf' disable-completion 'yes'

# Set height of the fzf results - default: full height
zstyle ':prezto:module:fzf' height '30%'

# Open fzf results in a tmux pane, if using tmux - default: no
zstyle ':prezto:module:fzf' tmux 'yes'

# Order output in reverse order - default: no
zstyle ':prezto:module:fzf' reverse 'yes'

# Set the color scheme
zstyle ':prezto:module:fzf' color-scheme 'Solarized Light'
```

## Color Schemes

The `colors.zsh` file currently contains fourteen color schemes from <https://github.com/junegunn/fzf/wiki/Color-schemes> and the four defaults: `dark`, `light`, `16` and `bw`. You can add your own schemes to the `colors.zsh` file and set the scheme in your `.zpreztorc`.
