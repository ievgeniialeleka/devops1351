#! /bin/bash

#===========OS Version ================
echo "OS version:"
cat /etc/os-release | grep "^NAME=" | cut -d = -f2
if [ $? -gt  0 ]; then
  echo "OS version not found"
fi

echo " "

#===========Users with bash ============
echo "Users with bash shell installed:"
cat /etc/passwd | grep bin/bash | cut -d : -f1

if [ $? -gt 0 ]; then
  echo "No users with bash shell installed found"
fi

echo " "

#==========Open ports ==================
echo "Open ports"
ss -tulpn
if [ $? -gt 0 ]; then
  netstat -tulpn
  if [ $? -gt 0 ]; then
  echo "Netstst and ss command are not available to display open ports."
  fi
fi
