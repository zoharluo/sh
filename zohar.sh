#!/bin/bash
# 获取脚本的绝对路径
SCRIPT_PATH="$(realpath "$0")"
# 一级菜单
main_menu() {
  clear
  echo "==================== 一键脚本菜单 ===================="
  echo "1. 常用功能脚本"
  echo "2. 代理相关脚本"
  echo "6. 测试脚本合集"
  echo "7. 综合功能脚本"
  echo "8. 一键安装常用环境及软件"
  echo "9. 系统功能"
  echo "0. 退出"
  echo "====================================================="
  read -p "请输入对应数字选择分类: " choice
  case $choice in
    1) common_scripts ;;
    2) proxy_scripts ;;
    6) test_scripts ;;
    7) integrated_scripts ;;
    8) software_install ;;
    9) system_functions ;;
    0) exit ;;
    *) echo "输入错误，请按回车键重试"; read; main_menu ;;
  esac
}

# 1. 常用功能脚本
common_scripts() {
  clear
  echo "1. 常用功能脚本:"
  echo "  1. 查询IP (IPv4 和 IPv6)"
  echo "  2. 添加SWAP"
  echo "  3. 多功能BBR安装脚本"
  echo "  4. 设置IPv4优先"
  echo "  5. 设置IPv6优先"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) 
      ipv4=$(curl -s ip.sb -4)
      ipv6=$(curl -s ip.me -6)
      echo -e "查询结果：\nIPv4: $ipv4\nIPv6: $ipv6"
      read -p "按回车键返回菜单" 
      common_scripts ;;
    2) wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh ;;
    3) wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh ;;
    4) sed -i 's/#precedence ::ffff:0:0\/96  100/precedence ::ffff:0:0\/96  100/' /etc/gai.conf ;;
    5) sed -i 's/precedence ::ffff:0:0\/96  100/#precedence ::ffff:0:0\/96  100/' /etc/gai.conf ;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; common_scripts ;;
  esac
}


# 2. 代理相关脚本
proxy_scripts() {
  clear
  echo "2. 代理相关脚本:"
  echo "  1. ArgoX"
  echo "  2. 涌哥SB脚本"
  echo "  3. x-ui"
  echo "  4. Warp"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/argox/main/argox.sh) ;;
    2) bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/sing-box-yg/main/sb.sh) ;;
    3) bash <(wget -qO- https://raw.githubusercontent.com/sing-web/x-ui/main/install_CN.sh) ;;
    4) wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh 4 ;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; proxy_scripts ;;
  esac
}

# 6. 测试脚本合集
test_scripts() {
  clear
  echo "6. 测试脚本合集:"
  echo "  1. 融合怪"
  echo "  2. 流媒体及IP质量测试-常用版本"
  echo "  3. 流媒体及IP质量测试-原生检测脚本"
  echo "  4. 流媒体及IP质量测试-准确度最高"
  echo "  5. 流媒体及IP质量测试-IP质量体检脚本"
  echo "  6. Speedtest(测速脚本)"
  echo "  7. Taier(测速脚本)"
  echo "  8. hyperspeed(测速脚本)"
  echo "  9. 全球测速(测速脚本)"
  echo " 10. 直接显示回程（小白用这个）"
  echo " 11. 回程详细测试（推荐）"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh) ;;
    2) bash <(curl -L -s check.unlock.media) ;;
    3) bash <(curl -sL Media.Check.Place) ;;
    4) bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh) ;;
    5) bash <(curl -sL IP.Check.Place) ;;
    6) bash <(curl -sL bash.icu/speedtest) ;;
    7) bash <(curl -sL res.yserver.ink/taier.sh) ;;
    8) bash <(curl -Lso- https://bench.im/hyperspeed) ;;
    9) curl -sL network-speed.xyz | bash ;;
    10) bash <(curl -sSL https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh) ;;
    11) wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh ;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; test_scripts ;;
  esac
}

# 7. 综合功能脚本
integrated_scripts() {
  clear
  echo "7. 综合功能脚本:"
  echo "  1. 科技lion"
  echo "  2. SKY-BOX"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) curl -sS -O https://kejilion.pro/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh ;;
    2) wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh ;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; integrated_scripts ;;
  esac
}

# 8. 一键安装常用环境及软件
software_install() {
  clear
  echo "8. 一键安装常用环境及软件:"
  echo "  1. docker"
  echo "  2. gost"
  echo "  3. 极光面板"
  echo "  4. 哪吒监控V0"
  echo "  5. 哪吒监控V1"
  echo "  6. 宝塔"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) curl -sSL https://get.daocloud.io/docker | sh ;;
    2) wget --no-check-certificate -O gost.sh https://raw.githubusercontent.com/qqrrooty/EZgost/main/gost.sh && chmod +x gost.sh && ./gost.sh ;;
    3) bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh) ;;
    4) curl -L https://raw.githubusercontent.com/nezhahq/scripts/refs/heads/v0/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh ;;
    5) curl -L https://raw.githubusercontent.com/nezhahq/scripts/refs/heads/main/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh ;;
    6) wget -O install.sh http://v7.hostcli.com/install/install-ubuntu_6.0.sh && sudo bash install.sh ;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; software_install ;;
  esac
}

# 9. 系统功能
system_functions() {
  clear
  echo "9. 系统功能:"
  echo "  1. 系统信息"
  echo "  2. 系统清理"
  echo "  3. 系统更新"
  echo "  4. 安装常用工具安curl、sudo、wget、net-tools、ufw"
  echo "  5. 添加z、zohar脚本快速启动"
  echo "  6. 删除z、zohar脚本快速启动"
  echo "  0. 返回上一级"
  read -p "请输入选择: " sub_choice
  case $sub_choice in
    1) clear ; bash <(curl -sL yabs.sh) ;;
    2) clear ; apt-get autoremove -y && apt-get clean && echo "清理完成";;
    3) clear ; apt-get update && apt-get upgrade -y && echo "更新完成";;
    4) apt update -y  && apt upgrade -y && apt install -y curl  && apt-get install sudo && apt install wget && apt install net-tools && apt install ufw && echo "安装完成";;
	5) clear ; add_alias;;
	6) clear ; remove_alias;;
    0) main_menu ;;
    *) echo "输入错误，请按回车键重试"; read; system_functions ;;
  esac
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

# 别名嵌入 alias 并使其生效
add_alias(){
  # 使用完整路径
  ALIAS_Z="alias z='$SCRIPT_PATH'"
  ALIAS_ZOHAR="alias zohar='$SCRIPT_PATH'"
  
  # 检查并添加到 ~/.bashrc
  if ! grep -Fxq "$ALIAS_Z" ~/.bashrc && ! grep -Fxq "$ALIAS_ZOHAR" ~/.bashrc; then
    echo "$ALIAS_Z" >> ~/.bashrc
    echo "$ALIAS_ZOHAR" >> ~/.bashrc
    echo "z,zohar 添加到快速启动脚本。"
  fi
  
  # 立即在当前 shell 中创建别名
  alias z="$SCRIPT_PATH"
  alias zohar="$SCRIPT_PATH"
}


# 启动主菜单
main_menu

