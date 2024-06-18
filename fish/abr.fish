# these are abreviations for fish shell
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

abbr -a ali '$EDITOR ~/.config/fish/abr.fish'
abbr -a alr '$EDITOR ~/.config/alacritty/alacritty.yml'
abbr -a cat bat
abbr -a conf 'cd ~/.config/'
abbr -a grep 'grep --color=auto'
abbr -a glp "git log --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %C(white)- %an, %ar%Creset'"
abbr -a gla 'git log --all --graph --decorate --oneline'
abbr -a i3conf "$EDITOR ~/.config/i3/config"
abbr -a muttrc 'cd ~/.config/mutt/;$EDITOR ~/.config/mutt/muttrc'
abbr -a python python3.12
abbr -a se 'fzf | xargs -r $EDITOR'
abbr -a sv sudoedit
abbr -a tiny 'tiny -c ~/.config/tiny/config.yml'
abbr -a vim $EDITOR
abbr -a vimrc '$EDITOR ~/.config/nvim/init.lua'
abbr -a fishrc '$EDITOR ~/.config/fish/config.fish'

# # Directory
abbr -a md mkdir -p
abbr -a rd rmdir

# # List directory contents
abbr -a ls exa -las type
abbr -a sl exa -las type
abbr -a l exa -ls type

abbr -a q exit
abbr -a yr 'cal -y'
abbr -a mr neomutt

#cargo
abbr -a c cargo
abbr -a ct 'cargo test'
abbr -a cb 'cargo build'
abbr -a cr 'cargo run'
abbr -a cleawr clear
abbr -a clwear clear
abbr -a cl clear
abbr -a e lvim
abbr -a lzg lazygit
abbr -a m make
abbr -a o open
abbr -a g git
abbr -a gu gitui
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'
abbr -a gtup 'git add . && git commit -am "tie-up commit" && git push'
abbr -a zt zathura
