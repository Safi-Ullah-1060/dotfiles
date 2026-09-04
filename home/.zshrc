# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# Pre-set plugin list, disable compaudit, and trim syntax highlighters
# before cachyos-config.zsh sources oh-my-zsh (it respects these if already set).
plugins=(git extract)
ZSH_DISABLE_COMPFIX=true
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

. "/home/safi/.deno/env"
. "$HOME/.cargo/env"

alias cls="clear"
alias start-suwayomi="$HOME/.Suwayomi-Server-v2.3.2243-linux-x64/suwayomi-launcher.sh"
alias update-boot="sudo bootctl update"
alias grep='grep --color=auto'
alias n='nvim'
alias cdmt="cd $HOME/Meri\ Tijori"

export km="$HOME/dotfiles/Keymaps.md"
export uni="$HOME/Uni-Data/Sem-V"
export cfg="$HOME/.config"
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

source "$HOME/.fzf-tab-completion/zsh/fzf-zsh-completion.sh"
bindkey '"\t"' fzf_zsh_completion
_fzf_zsh_completion_loading_msg() { echo "${PS1@P}${READLINE_LINE}" | tail -n1; }
export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
export FZF_COMPLETION_AUTO_COMMON_PREFIX_PART=true

eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export PATH="$PATH:/home/safi/.local/bin:$HOME/go/bin"
alias ls='eza --icons=auto'
alias ll='eza --icons=auto -l'
alias la='eza --icons=auto -la'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
