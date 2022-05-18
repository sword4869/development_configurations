# OS
先通过Microsoft Store下的kali。

然后发现 win10 的 WLS2 不支持usb，所以得手动安装 usb: [usbip](https://docs.microsoft.com/en-us/windows/wsl/connect-usb)。


然后发现kali不行：没有那个`linux-tools-5.4.0-77-generic`包。只有ubuntu有这个包，那么只能切换到ubuntu了.

然后运行发现 kernel 不支持：就是 `Building your own USB/IP enabled WSL 2 kernel` 这个得安。[usbip](https://github.com/dorssel/usbipd-win/wiki/WSL-support#usbip-client-tools)。

# 然而 网卡没用

```bash
$win: wsl --list
适用于 Linux 的 Windows 子系统分发版:
Ubuntu-20.04(默认)
docker-desktop-data
docker-desktop
kali-linux
wsl2-usbip 

# usbipd attach的是默认的OS。所以先设置默认的OS。
$win: wsl --set-default wsl2-usbip

$win: usbipd wsl list
BUSID  VID:PID    DEVICE                                                        STATE
1-2    148f:3070  802.11n USB Wireless LAN Card                                 Not attached
1-3    275d:0ba6  USB 输入设备                                                  Not attached
2-1    5986:2115  Integrated Camera                                             Not attached
2-2    0bda:c024  Realtek Bluetooth Adapter                                     Not attached

$win: usbipd wsl attach --busid 1-2
# $win: usbipd wsl detach --busid 4-4
```

```bash
root@DESKTOP-KSTB1B7:/mnt/c/Users/sword# lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 011: ID 148f:3070 Ralink Technology, Corp. RT2870/RT3070 Wireless Adapter
Bus 001 Device 002: ID 5986:2115 Acer, Inc Integrated Camera
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```
usb是有了，但是网卡没
```bash
root@DESKTOP-KSTB1B7:/mnt/c/Users/sword# iwconfig
lo        no wireless extensions.

bond0     no wireless extensions.

dummy0    no wireless extensions.

tunl0     no wireless extensions.

sit0      no wireless extensions.

eth0      no wireless extensions.

root@DESKTOP-KSTB1B7:/mnt/c/Users/sword# airmon-ng

PHY     Interface       Driver          Chipset
```