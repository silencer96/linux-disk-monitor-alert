Project 1: Disk Space Monitor + Alert

Goal:
Check all mounted disks
If disk usage > 80%, write alert to log file
Optional: Send email or use cron

-----------------------------------------------------------------------------------------------
##✅ Step 1: Script Skeleton:
Paste this into a file named disk_monitor.sh:

vi disk_monitor.sh

#!/bin/bash

THRESHOLD=80
TO="sakthisanjai9600@gmail.com"
HOSTNAME=$(hostname)

df -h | grep '^/dev/' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    mountpoint=$(echo $line | awk '{print $6}')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "Warning: $mountpoint is ${usage}% full on $HOSTNAME" | \
        mail -s "Disk Alert: $mountpoint usage is ${usage}%" $TO
    fi
done

---------------------------------------------------------------------------------------------------------
##✅ Step 2: Give Execute Permission:
chmod +x disk_monitor.sh
------------------------------------------------------------
##✅ Step 3: Test the Script:
./disk_monitor.sh
------------------------------------------------------------
##Check log:
cat /var/log/disk_alert.log
-----------------------------------------------------
##✅ Step 4: Automate with cron:
crontab -e

##Add this line (runs every hour):
*/30 * * * * /home/yourname/disk_monitor.sh  ##Check every 30min

##Check cron is running:
systemctl status cron
------------------------------------------------------------------
##✅ Install Send Mail on Centos:

✅ Step-by-Step: Send Mail from Linux Script:

sudo yum install mailx -y     ##For Centos
sudo yum install s-nail -y    ##For Centos

vi .mailrc

set smtp-use-starttls
set ssl-verify=ignore
set smtp=smtp://smtp.gmail.com:587
set smtp-auth=login
set smtp-auth-user=yourmail@gmail.com
set smtp-auth-password=your_app_password
set from="yourmail@gmail.com"

##🔐 Note: Use Gmail App Password if 2FA is enabled. Don’t use your real Gmail password!
------------------------------------------------------------------------------------------------
 ##✅ Correct Way to Install Mail Client on Rocky Linux:

##🔧 Step 1: Install s-nail (modern replacement for mailx)
sudo dnf install s-nail -y

##🔧 Step 2: Verify Installation
which mail


vi .mailrc

set smtp-use-starttls
set ssl-verify=ignore
set smtp=smtp://smtp.gmail.com:587
set smtp-auth=login
set smtp-auth-user=yourmail@gmail.com
set smtp-auth-password=your_app_password
set from="yourmail@gmail.com"

##🔐 Note: Use Gmail App Password if 2FA is enabled. Don’t use your real Gmail password!
---------------------------------------------------------------------------------------------
##✅ For Our Reference Check and Send Test Mail:
echo 'Test Mail Success!' | mail -s "Disk Alert OK" sakthisanjai9600@gmail.com
#Use Single Quotes
----------------------------------------------------------------------------




