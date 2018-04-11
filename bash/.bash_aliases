################
## MY ALIAS HERE (COPY TO /root/.bash_aliases AS WELL IF NEEDED FOR SU)
################
#
# addal - alias for editing aliases
#bit easier and they are useful right away. Note if the source failed, it will not echo "aliases sourced".
#
alias addal='vim ~/.bash_aliases; source ~/.bash_aliases && source $HOME/.bash_aliases && echo "aliases sourced  --ok."'
#
alias mybash='vim ~/.bash_aliases'
# root/aptitude stuff
alias root='sudo -i'
alias aptup='sudo aptitude update -y'
alias sysup='echo "system updates";sudo aptitude update && sudo aptitude upgrade'
alias aptget='sudo aptitude install'
alias aptfind='sudo aptitude search'
alias aptshow='sudo aptitude show'
alias aptrm='sudo aptitude purge'
alias aptx='sudo apt-get -f install'

#device power
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'

# terminal helpers
alias cls='clear'
alias qq='exit'
alias ..='cd ..'
alias ...='cd ../../'
alias home='cd ~; clear'
alias hist='history | grep'
# copy the current working directory to the clipboard
#alias cpwd='pwd | xclip -selection clipboard'

#saftey
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias del='trash '

#apps/command alias
#alias note= leafpad /home/manny/Documents/desk_note.txt&
alias i3config='vim ~/.i3/config'
alias weather='curl -4 http://wttr.in/"palm beach gardens"'
alias rtfm='gksu pcmanfm'
alias clock='tty-clock -c -t'
alias ping='ping -c 4'
alias diskinfo='df -h'
alias ipconfig='sudo ifconfig'
alias npad='leafpad'
alias rtvim='sudo vim'

#location alias
alias drives='cd /media; ls -l'
alias mydocs='cd /home/manny/Documents; clear; ls'
alias downloads='cd /home/manny/Downloads; ls'
alias desktop='cd /home/manny/Desktop; ls'


# unpack/unzip & other installers
alias pysetup='sudo python setup.py install --record /home/manny/pysetup_log.txt'
alias debin='sudo dpkg -i'
alias makex='sudo chmod +x'

# Parenting changing perms on / #
#alias chown='chown --preserve-root'
#alias chmod='chmod --preserve-root'
#alias chgrp='chgrp --preserve-root'

#alias cputemp='sensors | grep Core'
#alias fstab='sudo vim fstab'
alias neoshow='neofetch --w3m "/home/manny/Pictures/Stars-at-night.png";notify-send Jetlife;jetlife.sh'
#
# make dir and change to it
mcd () {
	mkdir -pv $1
	cd $1
}
# cd and ls in one command
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}
#
# function Extract for common file formats
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
#
#youtube downloader
function getyt {
    cd ~/Music/youtube_dl
    youtube-dl --extract-audio --audio-format mp3 -l https://youtu.be/Ds6lEewhJtI --no-playlist
    notify-send "Your mp3 is downloaded"
    ls
}
#
##
### END ALIAS ####
