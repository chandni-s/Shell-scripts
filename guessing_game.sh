#!/bin/bash

#setting the upper and lowed bound for random generator
min=1
max=64

#counter to keep track of number of times user is allowed to input
count=0

echo "Welcome to the number game."
echo "Guess a number between 1 and 64 (inclusive)."

while [ $count -lt 6 ]; 
do
        #setting random function to variable
        comp=$RANDOM

        #changing the upper and lower limit of random function
        #1 + whatever random integer generated % 64 will result between
        #1 and 64 inclusive
        comp=$[ $min + $comp % ($max) ]
        
        read input

        if [[ $input -lt 1 || $input -gt 64 ]]
        then
                echo "Usage: The number must be between 1 and 64!"
                if [ $count -lt 5 ]
                then
                        echo "Try again"
                else
                        echo "You lost"
                        echo "THE ANSWER WAS $comp"
                fi

        elif [ $input -eq $comp ]
        then
                echo "You won!"
                echo "THE ANSWER IS $comp"
                exit 1

        elif [ $input -lt $comp ]
        then
                echo "Too small"

                if [ $count -lt 5 ]
                then
                        echo "Try again"
                else
                        echo "You lost"
                        echo "THE ANSWER WAS $comp"
                fi
        else
                echo "Too big"
                if [ $count -lt 5 ]
                then
                        echo "Try again"
                else
                        echo "You lost"
                        echo "THE ANSWER WAS $comp"
                fi
        fi

        #increment the counter by 1
        let count=count+1
done
