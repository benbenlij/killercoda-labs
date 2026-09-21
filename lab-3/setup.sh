#!/bin/bash

# Add users
# Missing david for user to add
# Extra hacker user for user to remove
admins=("investigator" "john" "catherine" "stanley")
users=("michael" "jennifer" "ashley" "jeramiah" "jeff" "hacker")
for admin in "${admins[@]}"; do
    useradd -m -s /bin/bash "$admin"
    chown -R "$admin:$admin" "/home/$admin"
done
for user in "${users[@]}"; do
    useradd -m -s /bin/bash "$user"
    chown -R "$user:$user" "/home/$user"
done

# Set passwords
echo "investigator:Super\$3cuR3" | chpasswd
echo "john:password" | chpasswd
echo "catherine:I@mSoC0o1" | chpasswd
echo "stanley:stanley" | chpasswd

# README File
cat << 'EOF' > /home/investigator/README
This company's security policies require that all user accounts be password
protected. Employees are required to choose secure passwords, however this
policy may not be currently enforced on this computer.

Authorized Administrators:
investigator (you)
    password: Super$3cuR3
john
    password: password
catherine
    password: I@mSoC0o1
stanley
    password: stanley

Authorized Users:
michael
jennifer
david
ashley
jeramiah
jeff
EOF

# Store bad password hashes
awk -F: '$1=="john" {print $1":"$2}' /etc/shadow > /var/tmp/.bad-hashes
awk -F: '$1=="stanley" {print $1":"$2}' /etc/shadow >> /var/tmp/.bad-hashes

# Set UID 0 to jeff for user to fix
usermod -o -u 0 jeff

# Add admins to groups
# Set michael instead of stanley to admin for user to fix
admins[3]="michael"
for admin in "${admins[@]}"; do
    usermod -aG sudo "$admin"
done

# Signal to foreground script that script is completed
echo done > /tmp/setup0