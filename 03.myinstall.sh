#!/usr/bin/

# Install dependencies for lunarvim
#sudo pacman --noconfirm --needed -S python python-pip cmake unzip ninja tree-sitter ripgrep curl neovim rustup flake8 fish fisher exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc sddm paru gvfs-smb thunar thefuck swappy viewnior tumbler brightnessctl lazygit vlc kodi jq grim slurp wl-clipboard socat dunst trayer
sudo pacman --noconfirm --needed -S python python-pip cmake unzip ninja tree-sitter ripgrep curl neovim rustup flake8 exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc paru gvfs-smb thunar thefuck swappy viewnior tumbler lazygit vlc kodi jq grim slurp wl-clipboard socat dunst

rustup default stable

paru -S base-devel pokemon-colorscripts-git hyprland-git hyprpicker-git xdg-desktop-portal-hyprland-git waybar-hyprland cava kitty wofi starship wl-clipboard swaync swaylock-effects swaylockd tty-clock-git playerctl pavucontrol btop mpd mpd-mpris mpv mpv-mpris qt5-base qt5-wayland qt6-base qt6-wayland lsd geany bat light cliphist-bin polkit-gnome g4music wlogout visual-studio-code-bin boo-grub-git sddm-git boo-sddm-git fnm luarocks ripgrep shellcheck shfmt --needed
paru -R xdg-desktop-portal-wlr
# paru -S system76-power obs-studio wlrobs-hg v4l2loopback-dkms v4l2loopback-utils v4l-utils waydroid binder_linux-dkms chromium-wayland-vaapi qalculate-gtk qimgv-light rlr-git uget onlyoffice --needed

cd ~/Downloads
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/
sudo cp -r themes/Tokyonight-Dark-BL-LB /usr/share/themes/

cd ~/Downloads
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/
sudo cp -r icons/Tokyonight-Moon /usr/share/icons/

cd ~/Downloads
git clone https://github.com/EliverLara/Sweet.git -b nova
cd Sweet/
sudo cp -r kde/cursors/Sweet-cursors /usr/share/icons/

# cd ~/Downloads
# git clone https://github.com/PROxZIMA/.dotfiles.git
# cd .dotfiles
# cp -r .config .icons .local .mpd .ncmpcpp .scripts ~/
# cp .face .fonts.conf .dmrc .gtkrc-2.0 .zshrc .p10k.zsh ~/
cp -rv ~/Downloads/archHyprlan/* ~/

# Fast Node Manager & Node & NPM
# --------------------------------------
# Change the current NodeJS LTS version below
# NODE_VERSION="19.6.0"
# fnm install $NODE_VERSION
# fnm default $NODE_VERSION
# fnm use $NODE_VERSION

fnm install --latest
NODE_VERSION=$(node --version)
# node --version > .node-version
echo $NODE_VERSION >.node-version
fnm default $NODE_VERSION
fnm use $NODE_VERSION
# NPM
# ---
# Neovim dependencies
npm install -g neovim tree-sitter-cli yarn
# Linters, formatters etc.
npm install -g eslint_d markdownlint-cli prettier stylelint write-good

# PIP
# ---
# Neovim dependency
pip3 install pynvim

# Pyhton linters/formatters
pip3 install black isort flake8

# Lua linter
# ----------
sudo luarocks install luacheck

# Lua formatter
# -------------

cd ~/.local/bin
wget https://github.com/JohnnyMorganz/StyLua/releases/download/v0.16.1/stylua-linux-x86_64.zip
unzip stylua-linux-x86_64.zip
rm stylua-linux-x86_64.zip
chmod +x stylua

# LunarVim v1.2
# ------------------
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

# My LunarVim configuration
# -------------------------
cd ~/.config
mv lvim lvim-orig
git clone https://github.com/PasiBergman/lvim.git lvim-my
ln -s lvim-my lvim
