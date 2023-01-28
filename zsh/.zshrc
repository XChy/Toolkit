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

 #aliases
 alias e='nvim-qt'

#add my customed services
export PATH=/home/xchy/CustomedService:$PATH
