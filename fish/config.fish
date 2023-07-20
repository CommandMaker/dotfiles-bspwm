# Set environment
set TERM "xterm-256color"             
set EDITOR "micro"
set VISUAL "kate"

## Source .profile to apply its values
source ~/.profile

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

## Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

## Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Useful aliases
alias ls='exa -ala --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | egrep '^\.'"

alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   #Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              #Sort installed packages according to size in MB (expac must be installed)

#get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Custom aliases
alias phpbc="php bin/console"
alias cls="clear"
alias !s="sudo"
alias dc="docker-compose"
alias de="USER_ID=(id -u) GROUP_ID=(id -g) docker-compose exec"

## Import colorscheme from 'wal' asynchronously
if type "wal" >> /dev/null 2>&1
   cat ~/.cache/wal/sequences
end

## Run neofetch if session is interactive
if status --is-interactive 
   and not string match -q $TERMINAL_EMULATOR "JetBrains-JediTerm"
  echo ""
  neofetch
end

# ASDF
source /opt/asdf-vm/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

# PATH Variable
set ANDROID_SDK_ROOT "/home/command_maker/Android/Sdk"

set PATH "$HOME/bin:$HOME/.local/bin:(yarn global bin):$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$HOME/.config/composer/vendor/bin:$HOME/.cargo/bin:$PATH"

# Add transparency to XTerm window
bash -c "[ -n \"$XTERM_VERSION\" ] && transset-df -a > /dev/null"
fish_add_path /home/command_maker/.spicetify

# pnpm
set -gx PNPM_HOME "/home/command_maker/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/command_maker/.local/share/pnpm/store/v3/tmp/dlx-18261/node_modules/.pnpm/tabtab@2.2.2/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/command_maker/.local/share/pnpm/store/v3/tmp/dlx-18261/node_modules/.pnpm/tabtab@2.2.2/node_modules/tabtab/.completions/electron-forge.fish
