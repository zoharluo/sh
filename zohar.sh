#!/bin/bash

# 获取脚本的绝对路径
SCRIPT_PATH="$(realpath "$0")"

# 定义主函数
zohar_sh(){
  while true; do
    # 输出菜单选项
    echo "1. 安装 WARP"
    echo "2. 安装 WARP"
    echo "3. 删除别名"
    echo "4. 退出"
    # 读取用户输入
    read -e -p "请输入你的选择: " choice
    # 根据用户输入执行对应操作
    case $choice in
      1) 
        clear
        wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh 4
        ;;
      2) 
        clear
        echo "选项 2 尚未实现。" 
        ;; 
      3)
        remove_alias
        ;;
      4)
        echo "退出程序..."
        break
        ;;
      *)
        echo "无效的输入! 请重新选择。"
        ;;
    esac
  done
}

# 删除别名
remove_alias(){
  # 定义要删除的别名
  ALIAS_Z="alias z='$SCRIPT_PATH'"
  ALIAS_ZOHAR="alias zohar='$SCRIPT_PATH'"
  
  # 从 ~/.bashrc 中删除别名
  sed -i "\|$ALIAS_Z|d" ~/.bashrc
  sed -i "\|$ALIAS_ZOHAR|d" ~/.bashrc
  
  # 取消当前 shell 中的别名
  unalias z 2>/dev/null
  unalias zohar 2>/dev/null
  
  echo "已删除 z 和 zohar 别名。"
  
  # 重新加载 ~/.bashrc 以确保更改生效
  source ~/.bashrc
}

# 嵌入 alias 并使其生效
add_alias(){
  # 使用完整路径
  ALIAS_Z="alias z='$SCRIPT_PATH'"
  ALIAS_ZOHAR="alias zohar='$SCRIPT_PATH'"
  
  # 检查并添加到 ~/.bashrc
  if ! grep -Fxq "$ALIAS_Z" ~/.bashrc && ! grep -Fxq "$ALIAS_ZOHAR" ~/.bashrc; then
    echo "$ALIAS_Z" >> ~/.bashrc
    echo "$ALIAS_ZOHAR" >> ~/.bashrc
    echo "z,zohar 添加到快速启动脚本。"
    # 立即在当前 shell 中创建别名
    alias z="$SCRIPT_PATH"
    alias zohar="$SCRIPT_PATH"
  fi
}


# 添加别名
add_alias

# 调用主函数
zohar_sh
