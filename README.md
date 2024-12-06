# Dotfiles Configuration

This repository contains configuration files for various tools and environments used in my development workflow. Below is the directory structure:

## Directory Structure

```
.
├── .config
│   ├── lazygit
│   │   └── config.yml
│   ├── nvim
│   │   ├── coc-settings.json
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   └── lua
│   │       └── josean
│   │           ├── core
│   │           │   ├── init.lua
│   │           │   ├── keymaps.lua
│   │           │   └── options.lua
│   │           ├── lazy.lua
│   │           └── plugins
│   │               ├── alpha.lua
│   │               ├── auto-session.lua
│   │               ├── autopairs.lua
│   │               ├── colorscheme.lua
│   │               ├── telescope.lua
│   │               └── which-key.lua
│   └── tmux
│       ├── plugins
│       │   ├── tmux-continuum
│       │   ├── tmux-resurrect
│       │   └── tmux-themepack
│       └── tmux.conf
├── .p10k.zsh
└── .zshrc
```

## Included Configurations

- **Lazygit:** `~/.config/lazygit/config.yml`  
  Configurations for managing Git repositories using Lazygit.

- **Neovim:** `~/.config/nvim/`

  - Configurations for Neovim, including plugins, keymaps, and LSP settings.

- **TMUX:** `~/.config/tmux/`

  - TMUX configurations with plugins for persistence, theming, and navigation.

- **ZSH:** `.zshrc` and `.p10k.zsh`
  - ZSH shell configuration with Powerlevel10k theming.

---

## Using `stow` to Manage Dotfiles

### Why Use `stow`?

`stow` is a symlink management tool that makes it easy to maintain dotfiles in a repository. It ensures that configuration files in the repo are correctly linked to their respective locations in the home directory.

### Benefits:

- **Modularity:** Each configuration is separated by tools (e.g., `nvim`, `tmux`).
- **Portability:** Easily sync configurations across multiple machines.
- **Clean Directory Structure:** Avoid cluttering the home directory.

---

### Steps to Set Up `stow`

1. **Install `stow`:**

   ```bash
   sudo apt install stow    # For Debian/Ubuntu
   brew install stow        # For macOS

   ```

2. Organize Dotfiles:<br/>
   • Create subdirectories for each tool (e.g., nvim, tmux).<br/>
   • Place the actual dotfiles in the corresponding directories
3. Link Dotfiles:
   Navigate to the root of your dotfiles directory and use stow to create symlinks:

   ```
   stow nvim
   stow tmux
   stow zsh
   ```

Or you can use `stow .` to execute all at once.

4. Verify Symlinks:
   After running stow, the dotfiles will be symlinked to their respective locations in the home directory.
   Example:<br/>
   • ~/.config/nvim/ → Points to dotfiles/nvim/.config/nvim/<br/>
   • ~/.tmux.conf → Points to dotfiles/tmux/.tmux.conf
5. Using option `--adopt` in case that you don't want to remove real config file in your machine

```
stow --adopt <file-or-directory-or-dot>
```

6. Unlink Dotfiles (if needed):

```
stow -D nvim
```

---

### Example Workflow

1. Clone the repository:

```
git clone https://github.com/PoomKrit/dotfiles.git
```

2. Navigate to the dotfiles directory:

```
cd ~/dotfiles
```

3. Use stow to apply configurations:

```
stow nvim tmux zsh
```

## Notes

    • Ensure existing configurations are backed up to avoid conflicts.
    • For large setups, use .stowrc to specify default behaviors for stow.
