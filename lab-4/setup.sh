#!/bin/bash

# Users
users=("investigator" "john" "catherine" "verity" "michael" "jennifer" "david" "ashley" "jeramiah" "jeff")
for user in "${users[@]}"; do
    useradd -m -s /bin/bash "$user"
    chown -R "$user:$user" "/home/$user"
done

# Set admin passwords
echo "investigator:Super\$3cuR3" | chpasswd
echo "john:123456" | chpasswd
echo "catherine:cyberissotuff" | chpasswd
echo "verity:V3r!tYh@ha" | chpasswd

sudo usermod -aG sudo investigator

# Store bad password hashes
awk -F: '$1=="john" {print $1":"$2}' /etc/shadow > /var/tmp/.bad-hashes
awk -F: '$1=="catherine" {print $1":"$2}' /etc/shadow >> /var/tmp/.bad-hashes

# readme
cat << 'EOF' > /home/investigator/README
All possession or use of unauthorized media files or "hacking tools" is
strictly prohibited. This company's security policies require that all 
user accounts be password protected. Employees are required to choose
secure passwords, however this policy may not be currently enforced on
this computer.

Authorized Administrators:
investigator (you)
    password: Super$3cuR3
john
    password: 123456
catherine
    password: cyberissotuff
verity
    password: V3r!tYh@ha

Authorized Users:
michael
jennifer
david
ashley
jeramiah
jeff
EOF

# FORENSICS QUESTIONS
mkdir /home/investigator/Desktop
cat << 'EOF' > /home/investigator/Desktop/Q1
One of the company's employees has a secret file called "secrets.txt"
somewhere on this system. What is the full path to this file?

Answer: 
EOF
touch /root/secrets.txt

cat << 'EOF' > /home/investigator/Desktop/Q2
Another employee has a large unauthorized file in their home directory.
A file's size is measured in bytes, a small unit for an amount of
data that computers use. We know that the file is over 300 MB (megabytes).
What is the full path to this file?

Answer: 
EOF
dd if=/dev/zero of=/home/jeramiah/random_data.bin bs=1M count=301

cat << 'EOF' > /home/investigator/Desktop/Q3
An anonymous user has told us that david is hiding a secret diary in
this system. The user stated that this diary is known to be less than
50 MB. Assume that david is the owner of this file. What is the full 
path to this file?

Hint: Search for files with owner david and file size less than 50 MB

Answer: 
EOF
dd if=/dev/zero bs=1M count=25 | base64 > /var/tmp/diary.txt
sudo chown david:david /var/tmp/diary.txt

# Unauthorized media files
touch /home/john/meme.jpg
touch /home/catherine/.secret_video.mp4
mkdir /home/verity/songs
touch /home/verity/songs/verity_song.wav

# Hacking tool
apt install nmap -y



# Signal to foreground script that script is completed
echo done > /tmp/setup0
