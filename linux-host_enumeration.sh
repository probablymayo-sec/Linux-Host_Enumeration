#include <grp.h>

OUTPUTFILE = "Linux-Host-information.txt"

{
echo "Thanks for using my Linux Enumeration Script"
echo "I am not a C programmer by any means, nor am I good at bash scripting but yolo ig"
echo "---------------------------------------------------------------------------------"

echo "Kernel Version: " 
uname -a 
echo

echo "Distribution: " 
cat /etc/issue 
echo

echo "Current User: "
whoami 
current-user=$(whoami)
echo

echo "Users on the system: "
cat /etc/passwd
echo

echo "Binaries with special permissions (SUID): "
find / -xdev \( -path /proc -o -path /sys -o -path /run \) -prune -o -perm -4000 -type f -print 2>/dev/null
echo

echo "Binaries with special permissions (SGID) "
find / -xdev \( -path /proc -o -path /sys -o -path /run \) -prune -o -perm -2000 -type f -print 2>/dev/null
echo

echo "Binaries with both SUID and SGID special permissions: "
find / -xdev \( -path /proc -o -path /sys -o -path /run \) -prune -o -perm -6000 -type f -print 2>/dev/null
echo

echo "Current user group permissions: "
getent initgroups
echo

echo "Current user sudo permissions: "
sudo -l
echo

echo "Cron Status & PID: "
systemctl status cron | grep -e "Active" -e "Main PID"
echo

echo "Cron Directories: "
ls -lah /etc/cron.*
echo

echo "Users with Cron privs: "
grep cron /etc/passwd
echo

echo "Cron related files: "
find / -name “cron*” 2>/dev/null
echo 

echo "System-wide tasks: "
cat /etc/crontab
echo  

} >> OUTPUTFILE