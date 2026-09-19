set fish_greeting ""

function fish_mode_prompt
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # starship init fish | source
end

function fish_command_not_found
    set -l cmd $argv[1]
    if test -f ./$cmd; and test -x ./$cmd
        ./$cmd $argv[2..-1]
    else
        __fish_default_command_not_found_handler $argv
    end
end

# Y Function for yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Aliases
alias c='clear'
alias cls='clear'
alias vi='nvim'
alias em='emacs -nw'
alias lg='lazygit'
alias cat='bat'
alias bsh='/opt/homebrew/bin/bash'

alias gr='go run'
alias gb='go build'
alias cr='cargo run'
alias cb='cargo build'
alias odr='odin run'
alias odb='odin build'

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias sb='nvim ~/Documents/GitHub/Second-Brain/ROOT.md'

alias vconf='nvim ~/dotkeep/nvim/'

abbr gc "git clone"
abbr gc1 "git clone --depth 1"

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

zoxide init fish | source

set --export EDITOR nvim
set --export VISUAL nvim
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
export RUSTC_WRAPPER=sccache

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# nim
set -ga fish_user_paths /Users/rivethorn/.nimble/bin

set --export PATH ~/.local/bin/ $PATH
set --export PATH /opt/local/bin/ $PATH
set --export PATH ~/.mimir/bin/ $PATH
set --export HOMEBREW_NO_ENV_HINTS 1
set -gx LDFLAGS -L/opt/homebrew/opt/zlib/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/zlib/include
set -g fish_autosuggestion_enabled 0

set --global hydro_color_prompt cyan

# tirith init --shell fish | source
export PATH="/opt/homebrew/opt/r/opt/homebrew/opt/ruby/bin:$PATH"
set -gx PATH /Users/rivethorn/flutter/bin $PATH
# export PATH="$PATH":"$HOME/.pub-cache/bin"
# export PUB_HOSTED_URL="https://dart.devneeds.ir"
# export FLUTTER_STORAGE_BASE_URL="https://flutter.devneeds.ir"
# /Users/rivethorn/.local/bin/mise activate fish | source
undo init fish | source

set -gx PATH ~/Downloads/zig-aarch64-macos-0.17.0-dev.1426+58a94eaae/ $PATH

# set -gx CC /opt/homebrew/bin/clang
# set -gx CXX /opt/homebrew/bin/clang++
set -gx VCPKG_ROOT ~/vcpkg

# Added by `rbenv init` on Fri Aug 21 02:41:59 +0330 2026
status --is-interactive; and rbenv init - --no-rehash fish | source

# xfetch path
fish_add_path /Users/rivethorn/.local/bin

eval (/opt/homebrew/bin/brew shellenv fish)
