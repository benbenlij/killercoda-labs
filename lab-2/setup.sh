#!/bin/bash

# Create user for the student
useradd -m -s /bin/bash investigator
echo "investigator:password" | chpasswd
usermod -aG sudo investigator
chown -R investigator:investigator /home/investigator

# Objective 1
echo "Name: David
Last Seen: 5/16/2015" > '/home/investigator/hacker_info.txt'
# Create Forensics Question
mkdir '/home/investigator/Desktop'
echo "ANSWER: " > '/home/investigator/Desktop/Forensics Question 1.txt'

# Objective 2
touch '/home/investigator/unauthorized_image.jpg'

# Objective 3
mkdir '/home/investigator/quarantine'
mkdir '/home/investigator/Downloads'
touch '/home/investigator/Downloads/download.zip'
echo "This is critical information" > 'critical_info.txt'


# Set user to investigator instead of root
echo "su - investigator" >> /root/.bashrc