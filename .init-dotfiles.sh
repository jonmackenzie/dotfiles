# install oh-my-zsh, keeping the .zshrc from the repo and replacing the auto-generated one with it
mv .zshrc newzshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mv newzshrc .zshrc

# bring in all the submodules (mostly vim plugins)
config submodule init;
config submodule update;

