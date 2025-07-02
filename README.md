# 🛡️ Linux Disk Usage Monitor with Email Alert

This is a Bash script that monitors disk usage on a Linux system and sends an email alert if usage exceeds a defined threshold (default is 80%).

✅ Perfect for DevOps mini projects — shows scripting, automation, Linux admin, and monitoring skills!

---

## 📌 Features

- Monitors mounted file systems
- Sends email alerts via Gmail SMTP
- Customizable threshold and recipient
- Can be scheduled using `cron`
- Lightweight and works on most Linux distros

---

## ⚙️ How to Use

### 1. Clone the Repo

```bash
git clone https://github.com/silencer96/linux-disk-monitor-alert.git
cd linux-disk-monitor-alert

### 2. Configure .mailrc

cp .mailrc.example ~/.mailrc
nano ~/.mailrc

#Update with your Gmail and App Password

### 3. Run Script Manually

chmod +x disk_monitor.sh
./disk_monitor.sh

### 4. Automate with Cron

crontab -e
0 * * * * /full/path/to/disk_monitor.sh

🧑‍💻 Author
Sakthi Sanjai
Linux Admin | DevOps Learner
📧 sakthisanjai9600@gmail.com
