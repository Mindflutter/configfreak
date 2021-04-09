# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	colored-man-pages
	fzf
	kubectl
	pip
	poetry
	git
	docker
	docker-compose
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export PROMPT='%B%F{green} [%n%F{blue}@%F{green}%m] %F{red}☭ %F{blue}[%~] ${vcs_info_msg_0_}
%F{red}> %{$reset_color%}%b'

# User configuration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.poetry/bin:$PATH"
export EDITOR=micro

function iterm2_print_user_vars() {
  iterm2_set_user_var kubeconfig "$KUBECONFIG"
  iterm2_set_user_var kubens_current "$(kubens -c)"
  iterm2_set_user_var kubectx_current "$(kubectx -c)"
}

# Load pyenv
eval "$(pyenv init -)"

# History
setopt incappendhistory
setopt histfindnodups
setopt histignorealldups
export HISTSIZE=100000
export HIST_STAMPS="%d/%m/%y %T"
