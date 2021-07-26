# Install brew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Install packages
brew install git micro ranger tree htop openssl readline sqlite3 xz zlib fzf pyenv kubernetes-cli kubectx

# Install latest stable python
pyenv install-latest

# Install OMZ and some of its features
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
mkdir "$ZSH_CUSTOM"/plugins/poetry
poetry completions zsh > "$ZSH_CUSTOM"/plugins/poetry/_poetry

# Copy configs
cp .zshrc "$HOME"/.zshrc
cp ranger/rc.conf "$HOME"/.config/ranger/rc.conf
cp micro/settings.json "$HOME"/.config/micro/settings.json
