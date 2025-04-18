#!/bin/bash

echo "🔧 Installing Xcode Command Line Tools..."
xcode-select --install 2>/dev/null

echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "📦 Setting up Homebrew environment..."
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "🐍 Installing Python 3..."
brew install python

echo "📦 Installing pipx..."
brew install pipx
pipx ensurepath

echo "💻 Installing VS Code..."
brew install --cask visual-studio-code

echo "🧪 Creating a default virtual environment..."
python3 -m venv ~/python-dev-env
echo "source ~/python-dev-env/bin/activate" >> ~/.zshrc

echo "📦 Installing common Python packages..."
source ~/python-dev-env/bin/activate
pip install --upgrade pip
pip install black flake8 isort pytest ipython jupyter pandas numpy matplotlib requests

echo "💡 Installing optional extras..."
brew install --cask iterm2

echo "✨ Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✅ Setup Complete!"
echo "📝 Restart your terminal or run: source ~/.zprofile"
echo "🧠 Next time, your virtual env will auto-activate via ~/.zshrc"


