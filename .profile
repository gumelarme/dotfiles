export EDITOR=/usr/bin/nano
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export GOPATH="$HOME/dev/go"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:~/alias_program/
export PATH=$PATH:~/.config/composer/vendor/bin/ 
export PATH=$PATH:~/.npm-global/bin/
export PATH=$PATH:$GOROOT/bin/:$GOPATH/bin
export PATH=$PATH:$JAVA_HOME/bin

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx -d -r

sogou-qimpanel -d
~/.fehbg &


