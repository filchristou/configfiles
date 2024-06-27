CHAPPS=~/chapps

mkdir -p $CHAPPS/apps/
mkdir -p $CHAPPS/bin/

touch ~/.bashrc_machine_specific.sh
ln -sf ~/configfiles/bashrc ~/.bashrc
ln -sf ~/configfiles/nvim ~/.config/nvim
ln -sf ~/configfiles/wezterm.lua ~/.wezterm.lua

if [[ `uname -n` == *"cnode"* ]] || [[ `uname -n` == "pc114" ]] ; then
	# IKR devices

    # binaries folder

    # install juliaup
    curl -fsSL https://install.julialang.org | sh

    # install wezterm
    curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
    chmod +x WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
    mv ./WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage $CHAPPS/bin/wezterm

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
