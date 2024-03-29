# Created by newuser for 5.8.1
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

 # 配置zsh 当前使用的主题
 ZSH_THEME="powerlevel9k/powerlevel9k"
 # P9k 使用的模式
 # 有些主机名很长并以.分隔；默认为 %m ，数字表示要显示的段数，负数表示只显示最后一段
 POWERLEVEL9K_HOST_TEMPLATE=""
 POWERLEVEL9K_MODE='nerdfont-complete'
 # 显示在左边的提示元素（分段位于括号中并以空格隔开）
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable vcs)
 # 显示在右边的提示元素（分段）
 POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
 # 左侧提示符是否显示两行（光标显示在下一行）
 # POWERLEVEL9K_PROMPT_ON_NEWLINE=true
 eval "$(lua ~/z.lua/z.lua --init zsh)"

 # Aliases
alias e='nvim'
alias eu='neovide'

# Add my customed services
export PATH=/home/xchy/CustomedService:$PATH
export PATH=/opt/riscv64/bin:$PATH
export PATH=/opt/qemu/bin:$PATH

# Input
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# History 
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
