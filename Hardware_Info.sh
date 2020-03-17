#!/bin/bash
DELAY=5
while [[ $REPLY != 0 ]]; do
    clear
    cat <<_EOF_
        Please Select:
        1. RAM Information
        2. CPU Information 
        3. Board Information
	4. BIOS Information
	5. Disk Information
	6. Chassis Information
        0. Quit
_EOF_
    read -p "Enter selection [0-6] > "
    if [[ $REPLY =~ ^[0-6]$ ]]; then
        if [[ $REPLY == 1 ]]; then
		x=$(free -h)
		y=$(vmstat)
		z=$(cat /proc/meminfo)
		v=$(dmidecode -t 17)
		if [ $UID != 0 ]; then
			echo "Please Run With root access"
		else
			echo -e "\e[1;35m\t\t\t RAM Information "
			echo -e "\e[1;31m $x"
			echo -e "\e[1;32m $y"
			echo -e "\e[1;33m $z"
			echo -e "\e[1;34m $v"
		fi

	sleep $DELAY
        fi
    if [[ $REPLY == 2 ]]; then
	    a=$(cat /proc/cpuinfo)
	    b=$(dmidecode -t 4)
	    if [ $UID != 0 ]; then
		    echo "Please Run with root access"
	    else
		    echo -e "\e[1;31m\t\t\t CPU Information"
		    echo -e "\e[1;32m $a"
		    echo -e "\e[1;33m $b"
	    fi

        sleep $DELAY
    fi
    if [[ $REPLY == 3 ]]; then
	board=$(dmidecode -t 2)
	if [ $UID != 0 ]; then
		echo "Please Run with root access"
	else
		echo -e "\e[1;31m\t\t\t Board Information "
		echo -e "\e[1;33m $board"
	fi
    sleep $DELAY
    fi
    if [[ $REPLY == 4 ]]; then
	    bios=$(dmidecode -t 0)
	    if [ $UID != 0 ]; then
		    echo "Please Run with root access"
	    else
		    echo -e "\e[1;31m\t\t\t BIOS Information "
		    echo -e "\e[1;34m $bios"
	    fi
	    sleep $DELAY
    fi
    if [[ $REPLY == 5 ]]; then
	    disk1=$(df -h)
	    disk2=$(fdisk -l)
	    if [ $UID != 0 ]; then
		    echo "Please Run with root access"
	    else
		    echo -e "\e[1;31m\t\t\t Disk Information "
		    echo -e "\e[1;35m $disk1"
		    echo -e "\e[1;36m $disk2"
	    fi
	    sleep $DELAY
    fi
    if [[ $REPLY == 6 ]]; then
	    chassis=$(dmidecode -t 3)
	    if [ $UID != 0 ];then
		    echo "Please Run with root access"
	    else
		    echo -e "\e[1;31m\t\t\t Chassis Information "
		    echo -e "\e[1;37m $chassis"
	    fi
	 sleep $DELAY
    fi
 else
        echo -e "\e[1;36m Invalid entry.\e[0m\n"
	printf " \033[1;36m Please Enter the Valid Entry\n"
	break
        sleep $DELAY
    fi


done
printf "\033[1;35m Exit \n"
echo -e "\e[1;35mProgram terminated :( . \e[0m"

