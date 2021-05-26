#/bin/bash
echo
echo
echo "本脚本仅适用于在Ubuntu环境下编译"
echo
echo
sleep 2s
sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler ccache xsltproc rename antlr3 gperf curl screen upx



clear 
echo
echo 
echo 
echo "|*******************************************|"
echo "|                                           |"
echo "|                                           |"
echo "|           基本环境部署完成......          |"
echo "|                                           |"
echo "|                                           |"
echo "|*******************************************|"
echo
echo


if [ "$USER" == "root" ]; then
	echo
	echo
	echo "请勿使用root用户编译，换一个普通用户吧~~"
	sleep 3s
	exit 0
fi

rm -Rf openwrt

echo "


1. X86_64

2. Hc5962

3. Exit
"

while :; do

read -p "你想要编译哪个固件？ " CHOOSE

case $CHOOSE in
	1)
		firmware="x86_64"
	break
	;;
	2)
		firmware="Hc5962"
	break
	;;
	3)	exit 0
	;;

esac
done


git clone https://github.com/coolsnowwolf/lede openwrt
cd openwrt

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomato package/lean/luci-theme-opentomato
svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-vssr package/lean/luci-app-vssr
svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-openclash package/lean/luci-app-openclash

git clone https://github.com/garypang13/luci-app-bypass.git package/lean/luci-app-bypass
git clone https://github.com/garypang13/smartdns-le package/lean/smartdns-le

svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb package/lean/lua-maxminddb
svn co https://github.com/garypang13/openwrt-packages/trunk/tcping package/lean/tcping
svn co https://github.com/garypang13/openwrt-packages/trunk/chinadns-ng
svn co https://github.com/garypang13/openwrt-packages/trunk/shadowsocksr-libev
svn co https://github.com/garypang13/openwrt-packages/trunk/v2ray-plugin package/lean/v2ray-plugin
svn co https://github.com/garypang13/openwrt-packages/trunk/xray-core package/lean/xray-core
svn co https://github.com/garypang13/openwrt-packages/trunk/trojan-plus package/lean/trojan-plus
svn co https://github.com/garypang13/openwrt-packages/trunk/trojan-go package/lean/trojan-go
svn co https://github.com/garypang13/openwrt-packages/trunk/naiveproxy package/lean/naiveproxy
svn co https://github.com/garypang13/openwrt-packages/trunk/shadowsocks-rust package/lean/shadowsocks-rust
svn co https://github.com/garypang13/openwrt-packages/trunk/xray-plugin package/lean/xray-plugin

