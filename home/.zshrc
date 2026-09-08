# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize Zsh Completion System (highly recommended for FZF)
# autoload -Uz compinit && compinit

export ZSH_DISABLE_COMPFIX="true"


# autoload -Uz compinit
# for _dump in ~/.zcompdump(N.mh+24); do
#   compinit
# done
# compinit -C


# Environment Loaders
. "/home/safi/.deno/env"
. "$HOME/.cargo/env"

# Path Updates (Zsh Native Array Approach)
path+=("$HOME/.local/bin" "$HOME/go/bin")
export PATH


# FZF Tab Completion Configuration
source "$HOME/.fzf-tab-completion/zsh/fzf-zsh-completion.sh"
_fzf_zsh_completion_loading_msg() { echo "${PS1@P}${READLINE_LINE}" | tail -n1; }


# Zoxide Initialization
eval "$(zoxide init zsh)"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  dnf
  golang
  rust
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey '\t' fzf_completion

# Aliases
alias cls="clear"
alias start-suwayomi="$HOME/.Suwayomi-Server-v2.3.2243-linux-x64/suwayomi-launcher.sh"
alias update-boot="sudo bootctl update"
alias grep='grep --color=auto'
alias n='nvim'
alias cdmt="cd $HOME/Meri\ Tijori"
alias ls='eza --icons=auto'
alias ll='eza --icons=auto -l'
alias la='eza --icons=auto -la'

# Environment Variables
export km="$HOME/dotfiles/Keymaps.md"
export uni="$HOME/Uni-Data/Sem-V"
export cfg="$HOME/.config"
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Functions
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Powerlevel10k Theme Loading
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
