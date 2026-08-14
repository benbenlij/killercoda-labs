#!/bin/bash

# Create user for the student
useradd -m -s /bin/bash investigator
echo "investigator:password" | chpasswd
usermod -aG sudo investigator
chown -R investigator:investigator /home/investigator

# Create hacker user
useradd -m h@ck3r
chown -R h@ck3r:h@ck3r /home/h@ck3r

# Add hidden files
touch '/home/investigator/.$eCr3t.txt'
mkdir -p -- /opt/-super-safe
touch -- '/opt/-super-safe/hacker_file.txt'
touch '/home/h@ck3r/f@k3d!arY.txt'

# Set user to investigator instead of root
echo "su - investigator" >> /root/.bashrc