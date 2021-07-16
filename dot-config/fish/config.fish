# fish configuration
#
## fish prompt
function fish_prompt
  set_color cyan --bold
  printf "%s" (prompt_pwd)
  set_color normal
  printf " >"
  set_color yellow --bold
  printf " %s" (git symbolic-ref --short HEAD 2> /dev/null)
  set_color green --bold
  printf "\n\$ "
  set_color normal
end

## fish Vi mode
# fish_vi_key_bindings
function fish_mode_prompt
end

## fish greeting
function fish_greeting
  ufetch
end

## XDG alias
alias startx="startx $XINITRC"
alias irssi="irssi --config='$XDG_CONFIG_HOME'/irssi/config --home='$XDG_DATA_HOME'/irssi"
alias dict="dict -c '$XDG_CONFIG_HOME'/dict/dictrc"
alias abook="abook --config '$XDG_CONFIG_HOME'/abook/abookrc --datafile '$XDG_DATA_HOME'/abook/addressbook"
alias mbsync="mbsync -c '$XDG_CONFIG_HOME'/isync/mbsyncrc"

## load all functions
fzf_key_bindings # FZF key bindings
personal_key_bindings # personal key bindings

## User alias
alias notify-send=dunstify
alias sbcl="rlwrap sbcl"
alias trans="rlwrap trans"
alias pipe-viewer="rlwrap pipe-viewer"

## User abbreviation
abbr cat "bat"
abbr e "nvim"
abbr enc "emacsclient -nc"
abbr ls "exa"
abbr se "sudoedit"
abbr ytdl "youtube-dl"
abbr ytv "pipe-viewer"

## User key bind
bind -M insert \ce "nvim +VimwikiIndex"
bind -M insert \ck fg
