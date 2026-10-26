#!/bin/bash
#this is a guesting game
name="$1"

if [[ -z $name ]]; then
printf "usage: ./intro.sh <name> \n where name is the name of the user playing the game"
exit 1
fi

echo "=========================================="
printf '..%s..'"Hi $name, welcome to our guesting game. Please identify the level you will like to play"
echo "========================================"

number=$((RANDOM  % 100 + 1))
guess=-1
count=0

level="${2,,}"
if [[ -z $name ]]; then
printf "usage: ./intro.sh <name> \n where name is the name of the user playing the game"
exit 1

if [[ -z "$level" ]] || [[ "$level == Normal" ]]; then
    max=100
    while (( guess !=number )); do
    read -rp " please guess a number between o and 100" guess

if [[ -z $guess ]] ; then
        echo "please enter a number";
        exit 1;
    elif (( guess > number ));then
        echo "your guest is too high"
    elif (( guess < number )); then
        echo "your guest is too low"
fi


if [[ "$level" == "easy" ]]; then
        max=50
    elif [[ "$level" == "normal" ]]; then
        max=100 
    elif [[ "$level" == "hard" ]]; then
        max=1000
    else
        echo "No levels found. Use:easy, normal or hard"
        exit 1
fi

done 

number=$((RANDOM  % 100 + 1))
guess=-1
count=0


level="${2,,}"

if [[ -z $name ]]; then
printf "usage: ./intro.sh <name> \n where name is the name of the user playing the game"
exit 1

while (( guess != number )); do
    read -rp "please guess a number between 0 and 50" guess

if [[ -z $guess ]] ; then
        echo "please enter a number";
        exit 1;
    elif (( guess > number ));then
        echo "your guest is too high"
    elif (( guess < number )); then
        echo "your guest is to low"
fi
    ((count++))
done

while (( guess !=number )); do
    read -rp " please guess a number between o and 100" guess

if [[ -z $guess ]] ; then
        echo "please enter a number";
        exit 1;
    elif (( guess > number ));then
        echo "your guest is too high"
    elif (( guess < number )); then
        echo "your guest is to low"
fi
    ((count++))
done

if [[ "$level" == hard ]]; then
    max=1000
    while (( guess !=number )); do
    read -rp " please guess a number between o and 1000" guess

    if [[ -z $guess ]] ; then
        echo "please enter a number";
        exit 1;
    elif (( guess > number ));then
        echo "your guest is too high"
    elif (( guess < number )); then
        echo "your guest is to low"
    ((count++))
    else
        echo "correct! The number was $number"

elif [[ "$# -gt 2" ]]; then
    echo "Error. Incorrect level"
  break
echo "you nailed it good job. you guessed the right number after $count times "
fi
done
EOF