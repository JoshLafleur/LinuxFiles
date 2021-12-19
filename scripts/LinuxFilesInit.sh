git init --bare $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .vimrc
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added .vimrc"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .bashrc
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added .bashrc"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add scripts
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added scripts folder"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .config/i3/config
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added i3 config"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .config/i3status/config
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added i3status config"
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add .config/kitty/kitty.conf
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "added kitty config"

/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote add origin https://github.com/JoshLafleur/LinuxFiles.git
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME branch -M GentooLaptop
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push -u origin GentooLaptop

