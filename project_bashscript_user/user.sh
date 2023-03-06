#! /bin/bash

echo "Hello! Pls select your membership status (new member-1)/(created user-0)"
read ms
case $ms in
"1" )
echo "Welcome to The Company!" 
echo "There are a few steps for you to start working"

echo "Please create a new user..."
read -p 'New username is: ' nwusr
sudo useradd $nwusr 
#sudo su $nwusr
echo $PWD
cd /home/kali/Desktop
mkdir $nwusr 
cd $nwusr
echo "Now you can create files"
echo "Enter the name of file"
read file
touch $file
echo $PWD
ls ;;


"0" )
echo "Welcome back to work!" 
echo "Who would be the current user?"
cut -d: -f1 /etc/passwd

read ctusr
#sudo su $ctusr 
echo $PWD
cd /home/kali/Desktop
mkdir $ctusr 
cd $ctusr
echo $PWD
ls ;;

* )
echo "kdshcka"
esac


