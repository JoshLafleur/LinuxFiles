echo ".cfg" >> .gitignore
git clone --bare /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME  $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout GentooLaptop
