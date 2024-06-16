export PATH="$PATH:/home/eraldo/Development/gemon/target/release"
export PATH="$PATH:/home/eraldo/Development/tcp-echo/target/release"
export PATH="$PATH:/home/eraldo/Development/babel-fish/target/release"
export PATH="/home/eraldo/Development/rust-analyzer/target/release:$PATH"
export PATH="$PATH:/home/eraldo/.cargo/bin"
export PATH="$PATH:/home/eraldo/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin"
export JAVA_HOME="/usr/lib/jvm/jdk-22.0.1"
export PATH="$JAVA_HOME/bin:$PATH"
export MAVEN_HOME="/usr/lib/jvm/apache-maven-3.9.7"
export PATH="$PATH:$MAVEN_HOME/bin"
export XDG_CONFIG_HOME="/home/eraldo/.config"
export DEEPL_API_KEY="8c40dcd0-f824-4995-937a-eac16cfdf1ca:fx"
export BAT_THEME="Visual Studio Dark+"

alias l="ls -la"
alias t="tree"
alias pi="ssh pi@raspberrypi.local"
alias leptosf="leptosfmt ./**/*.rs"
alias tn="tmux new -s"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias bf="babel-fish"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
. "$HOME/.cargo/env"
alias mvn-run="mvn compile exec:java"
alias mvn-gen-quickstart-template="mvn archetype:generate -DgroupId=com.example -DartifactId=my-multi-module-project -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false"
mvn-gen-quickstart() {
    mvn archetype:generate -DgroupId=$2 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
}


eval "$(fzf --bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

source ~/fzf-git.sh/fzf-git.sh

# ---- Zoxide (better cd) ----
eval "$(zoxide init bash)"
alias cd="z"
