# Dotfiles Setup Makefile
# Usage: make link

.PHONY: link help

help:
	@echo "Dotfiles Setup Commands:"
	@echo "  make link    - Create symlinks for all config files"

link:
	@echo "Creating symlinks for dotfiles..."

	# Git config
	@ln -sf $(PWD)/git/gitconfig ~/.gitconfig
	@echo "✓ Linked git/gitconfig -> ~/.gitconfig"

	# Git ignore
	@ln -sf $(PWD)/git/gitignore ~/.gitignore_global
	@echo "✓ Linked git/gitignore -> ~/.gitignore_global"

	# Zsh config
	@ln -sf $(PWD)/shell/zshrc ~/.zshrc
	@echo "✓ Linked shell/zshrc -> ~/.zshrc"

	# Powerlevel10k config
	@ln -sf $(PWD)/shell/p10k.zsh ~/.p10k.zsh
	@echo "✓ Linked shell/p10k.zsh -> ~/.p10k.zsh"

	# Ghostty config (XDG)
	@mkdir -p ~/.config/ghostty
	@ln -sf $(PWD)/mac-apps/ghostty/config ~/.config/ghostty/config
	@echo "✓ Linked mac-apps/ghostty/config -> ~/.config/ghostty/config"

	@echo ""
	@echo "✓ All symlinks created successfully!"
	@echo ""
	@echo "Note: Some configs require additional setup:"
	@echo "  - iTerm2: Set preferences directory to $(PWD)/mac-apps/iterm in settings"
	@echo "  - Alfred: Set sync folder to your cloud storage in Alfred preferences"
