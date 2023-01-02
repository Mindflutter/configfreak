# Install brew (requires sudo, might prompt for password)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/"$USER"/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages
brew install git micro ranger tree htop openssl readline sqlite3 xz zlib fzf pyenv kubernetes-cli kubectx fd rg zoxide coreutils

# Install and set latest stable python
# TODO: fix variable substitution
# latest_python=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
pyenv install $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
eval "$(pyenv init --path)"
pyenv global $(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)

# Install OMZ and some of its features
/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -
mkdir "$ZSH_CUSTOM"/plugins/poetry
poetry completions zsh > "$ZSH_CUSTOM"/plugins/poetry/_poetry

# Copy configs
cp .zshrc "$HOME"/.zshrc
mkdir -p "$HOME"/.config/ranger/ "$HOME"/.config/micro/
cp ranger/rc.conf "$HOME"/.config/ranger/rc.conf
cp micro/settings.json "$HOME"/.config/micro/settings.json
