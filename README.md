# chromeos-autofanctrl
Chromeos fan control script, for chromebooks with fan speed problems.
# Desciption
When my Asus Flip CX5 chromebook would get hot, it would spin up its fans. After a while the chromebook would cool down, but the fans would keep spinning at 60% speed, even with the cpu at 40°C. 
This script resets the fans every 5 seconds, so they will function as intended. 
# Installation
1. Chromebook must be in developer mode *dev mode link*
2. Press ctrl+alt+t to open the terminal, then type ```shell``` and press enter.
3. Paste ```sudo curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/install.sh" | sudo bash``` into terminal and press enter.
4. After the chromebook reboots run ```sudo curl "https://raw.githubusercontent.com/Fornball/chromeos-autofanctrl/main/install.sh" | sudo bash -rebooted```
After rebooting a second time, the installation is complete.
