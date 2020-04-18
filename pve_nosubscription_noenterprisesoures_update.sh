# Tonton Jo - 2020
#Script for initial proxomox subscription and sources list settings
# https://www.youtube.com/watch?v=X-a_LGKFIPg

#Sources:
#https://pve.proxmox.com/wiki/Package_Repositories
#https://www.sysorchestra.com/remove-proxmox-5-3-no-valid-subscription-message/
#https://www.svennd.be/proxmox-ve-5-0-fix-updates-upgrades/

#I assume you know what you are doing and have a default configuration.

#If you want to manually enter commands below in order: enter thoses without "#" :-)

# distribution=$(. /etc/*-release;echo $VERSION_CODENAME)
# sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
# cp -n "/etc/apt/sources.list" "/etc/apt/sources.list.BCK"
# echo "deb http://download.proxmox.com/debian/pve $distribution pve-no-subscription" > /etc/apt/sources.list
# cp -n "/etc/apt/sources.list.d/pve-enterprise.list" "/etc/apt/sources.list.d/pve-enterprise.list.BCK"
# rm -f /etc/apt/sources.list.d/pve-enterprise.list
# apt-get -y update
# apt-get -y upgrade
# apt-get -y dist-upgrade

echo "Tonton Jo - 2020"
#1
# Defining distribution name:
echo "defining distribution name for sources list"
distribution=$(. /etc/*-release;echo $VERSION_CODENAME)

#2
#Remove Subscription:
echo "removing No Valid Subscription Message"
sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

#3
#Edit sources list:
# -n for not overwritting if file already exist
echo "backuping actual file -just in case.
cp -n "/etc/apt/sources.list" "/etc/apt/sources.list.BCK"
echo "adding sources list"
echo "deb http://download.proxmox.com/debian/pve $distribution pve-no-subscription" > /etc/apt/sources.list
echo "backuping /etc/apt/sources.list.d/pve-enterprise.list"
cp -n "/etc/apt/sources.list.d/pve-enterprise.list" "/etc/apt/sources.list.d/pve-enterprise.list.BCK"
echo "deleting /etc/apt/sources.list.d/pve-enterprise.list"
rm -f /etc/apt/sources.list.d/pve-enterprise.list

#4: update:
echo "updating"
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade