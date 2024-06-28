CHAPPS=~/chapps

mkdir -p $CHAPPS/apps/
mkdir -p $CHAPPS/bin/

touch ~/.bashrc_machine_specific.sh
ln -sf ~/configfiles/bashrc ~/.bashrc
ln -sf ~/configfiles/wezterm.lua ~/.wezterm.lua
ln -sf ~/configfiles/inputrc ~/.inputrc
ln -sf ~/configfiles/tmux.conf ~/.tmux.conf
ln -sf ~/configfiles/nvim ~/.config/nvim

if [[ `uname -n` == *"cnode"* ]] || [[ `uname -n` == "pc114" ]] ; then
	# IKR devices

    # binaries folder

    # install juliaup
    curl -fsSL https://install.julialang.org | sh

    WEZTERM_VERSION=20240203-110809-5046fc22
    WEZTERM_UBUNTU_VERSION=Ubuntu20.04
    WEZTERM_APPIMAGE=WezTerm-$WEZTERM_VERSION-$WEZTERM_UBUNTU_VERSION.AppImage
    # install wezterm
    curl -LO https://github.com/wez/wezterm/releases/download/$WEZTERM_VERSION/$WEZTERM_APPIMAGE
    chmod +x $WEZTERM_APPIMAGE
    ./$WEZTERM_APPIMAGE --appimage-extract
    rm $WEZTERM_APPIMAGE
    mv ./squashfs-root $CHAPPS/apps/wezterm
    ln -sf $CHAPPS/apps/wezterm/usr/bin/wezterm $CHAPPS/bin/

    # install nvim
    mkdir -p $CHAPPS/apps/nvim
    curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar -xz -C $CHAPPS/apps/nvim/ --strip-components=1
    ln -sf $CHAPPS/apps/nvim/bin/nvim $CHAPPS/bin/

    # cargo-bins in ~/.cargo/bin
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
    cargo binstall ripgrep

else
	# other devices with sudo rights
	echo "do nothing"
    # install homebrew
    
    # install riggrep
fi

# if ! type juliaup &> /dev/null; then ... fi
