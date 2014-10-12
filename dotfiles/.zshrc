#=============================================================#
export LANG=ja_JP.UTF-8
export PATH="/Users/takasuka-y/bin:/Users/takasuka-y/bin/platform-tool:/Users/takasuka-y/bin/tools:/Library/Developer/adt-bundle-mac-x86_64-20130219/tools:/Library/Developer/adt-bundle-mac-x86_64-20130219/platform-tools:/Users/ytakasuk/bin:/usr/local/Celler/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/php/5.3.10/bin:$PATH"
export PATH=$PATH:$HOME/.gvm/bin
export EDITOR="vim"
export __CF_USER_TEXT_ENCODING="0x1F5:0x08000100:14"
export JENKINS_HOME="/Users/Shared/Jenkins/Home"
bindkey -e
#=============================================================#

#=============================================================#
alias c='clear'
alias ll='ls -lhG'
alias lla='ls -lhaG'
alias llfrat='ls -lhFratG'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'
alias klabmemo='vim ~/Documents/klab.txt'
alias memo='vim ~/Documents/memo.txt'
alias screenrc='vim ~/.screenrc'
alias reload='source ~/.zshrc ~/.screenrc ~/.vimrc'
alias ctags='ctags -R --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i"'
alias tm='tmux'
alias tma='tmux attach'
alias tml='tmux list-window'
alias grep='grep --color'
alias g='grep'
alias phpunit='phpunit --colors --verbose'
alias history='cat ~/.zsh_history'
alias mysql-master-local='mysql -ugame05 -ppassword game05_test'
alias fileonly='grep / | sort | uniq'
#=============================================================#

#=============================================================#
#0:black、1:red、2:green、3:yellow、4:blue、5:magenta、6:cyan、7:white
setopt prompt_subst
autoload -Uz colors
autoload -Uz vcs_info
autoload colors
zstyle ':vcs_info:*' disable bzr
#zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':vcs_info:*' formats '[%b]'
precmd () {
    vcs_info 
    psvar[1]="$vcs_info_msg_0_"
}
#PROMPT=%F{2}%n@%m%f%F{5}::%f #tmux入れたしいらないかも
PROMPT='%F{2}» %f'
#PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ v%f%# '
RPROMPT=%B%F{6}%1v%f%F{1}[%~]%f%b
#RPROMPT='«`rprompt-git-current-branch`»%B%F{1}[%~]'
#=============================================================#

#=============================================================#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt append_history       # 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt extended_history     # zsh の開始・終了時刻をヒストリファイルに書き込む
setopt hist_ignore_dups     # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history        # シェルのプロセスごとに履歴を共有
setopt hist_no_store        # history (fc -l) コマンドをヒストリリストから取り除く
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
#=============================================================#

#=============================================================#
setopt auto_cd              # ディレクトリ名の入力だけでそのディレクトリに移動できる
setopt auto_pushd           # 移動元のディレクトリを自動的にディレクトリスタックに記憶する
#=============================================================#

#=============================================================#
autoload -U compinit
compinit
#=============================================================#
#
autoload bashcompinit
bashcompinit
source $(brew --prefix php-version)/php-version.sh && php-version 5

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/takasuka-y/.gvm/bin/gvm-init.sh" ]] && source "/Users/takasuka-y/.gvm/bin/gvm-init.sh"
