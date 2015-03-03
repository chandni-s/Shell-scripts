#!/bin/bash

#variable used  to keep track when options other than [1-5] are entered
track=false

clear

while [ true ];
do
        echo "----------------------------------------"
        echo "              MAIN - MENU               "
        echo "----------------------------------------"
        echo "1. Number of processor"
        echo "2. Memory information"
        echo "3. Number of users currently logged in"
        echo "4. Users with bash shell"
        echo "5. Exit"
        echo "----------------------------------------"

        #Ask user for the input for first time
        read -p "Please enter option [1-5]: " input

        #Evaluate the input and output information accordingly
        case $input in
                1) cat /proc/cpuinfo | grep processor | wc -l
                   ;;
                2) cat /proc/meminfo | grep -e MemTotal -e MemFree -e Shmem
                   ;;
                3) who | cut -d " " -f 1 | sort | uniq | wc -l
                   ;;
                4) ps aux | grep bash | cut -d " " -f 1 | sort | uniq
                   ;;
                5) exit;;

                #if any other option other than [1-5] is entered: display
                #this message below
                *) echo "Please enter option [1-5] only"
                   ;;
        esac

        #if user enters between option [1-5], then print the message below
        #and prompt the user
        if [ "$track" != true ]
        then
                echo "Press [enter] key to continue..."
                read input2
        fi
        clear
done