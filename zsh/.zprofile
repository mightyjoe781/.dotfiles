
# HOMEBREW Fix
eval "$(/opt/homebrew/bin/brew shellenv)"
# path+=$HOME/bin

# fzf
export FZF_DEFAULT_OPTS="--color=16 --color='fg:white,fg+:white:bold,bg+:bright-black,hl:magenta:bold,marker:white:bold,prompt:blue,info:yellow' --bind=down:half-page-down,up:half-page-up"
export FZF_DEFAULT_COMMAND="fd --type f \
  --hidden \
  --exclude .git \
  --exclude .DS_Store \
  --exclude .localized"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_PREVIEW_COMMAND="cat {}"
export EDITOR=nvim

#export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk/Contents/Home

# alias g++="g++ --std=gnu++17"

# source all files in .zshrc.d
if [[ -d $HOME/.zshrc.d ]]; then
    for _f in $HOME/.zshrc.d/*; do
        if [[ -x "$_f" ]] && [[ -f "$_f" ]]; then
            source $_f
        fi
    done
fi
