#!/bin/bash
#this is a guesting game
name="$1"

if [[ -z $name ]]; then
printf "usage: ./intro.sh <name> \n where name is the name of the user playing the game"
exit 1
fi

echo "=========================================="
printf '..%s..'"Hi $name, welcome to our guesting game. Please identify the level you will like to play"
echo "player: $name"
echo "level: $level"
echo "range: $max"
echo "========================================"

number=$((RANDOM  % 100 + 1))
guess=-1
count=0

level="${2,,}"
start_time=$(date "+%y-%m-%d %h:%m:%s")
start_seconds=$(date "+%s")

if [[ -z $name ]]; then
    printf "usage: ./intro.sh <name> \n where name is the name of the user playing the game"
    exit 1
fi

if [[ -z "$level" ]] || [[ "$level == Normal" ]]; then
    max=100
    while (( $guess != $number )); do
        read -rp " please guess a number between 0 and 100 " guess
    
        if [[ -z $guess ]] ; then
            echo "please enter a number";
            exit 1;
        elif (( $guess > $number ));then
            echo "your guest is too high"
        elif (( $guess < $number )); then
             echo "your guest is too low"
        fi
    done
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

while (( $guess != $number )); do
    read -rp "please guess a number between 0 and 50 " guess
done

if [[ "$level" == hard ]]; then
    max=1000
    while (( $guess != $number )); do
        read -rp " please guess a number between o and 1000 " guess

	# Read file line by line
	while IFS= read -r line || [[ -n "$line" ]]; do
		# Skip empty line
		[[ -z "$line" ]] && continue

		# Skip line that don't match epected criteria
		if [[ ! "$line" =~ , ]]; then
			echo "skipping demaged line: $line" >&2
			continue
		fi
	# show menu with warning
	show_menu()
	clear
	echo "=============================================="
	echo "                GAME MANU                     "
	echo "=============================================="

	# Display warnings if any lines were skipped anywhere
	total_skipped=$((SKIPPED_LEADERBOARD + SKIPPED_HISTORY + SKIPPED_PB))
	if [[ $total_skipped -gt 0 ]]; then
		echo -e "\033[33m warning: $total_skipped damage line(s) were skipped to prevent crashes:\033]0m"
		[[ $SKIPPED_LEADERBOARD -gt 0]] && echo " -Learderboard: $SKIPPED_LEADERBOARD skipped"
		[[ $SKIPPED_HISTORY -gt 0 ]]    && echo"  -HISTORY: $SKIPPED_HISTORY skipped"
		[[ $SKIPPED_PB -gt 0 ]]         && echo " -Personal Best: $SKIPPED_PB skipped"
		 echo "=========================================="

	fi

	echo "1. Play Game"
	echo "2. View Leaderboard"
	echo "3. View History"
	echo "4. Exit"
	echo "================================================="
	read -p " choose an option: " choice
case $choice in
            1)
                read -p "Enter level number (1, 2, or 3): " new_lvl
                if [[ "$new_lvl" =~ ^[1-3]$ ]]; then
                    CURRENT_LEVEL=$new_lvl
                fi
                ;;
            2) view_leaderboard ;;
            3) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid option!"; sleep 1 ;;
        esac
    

	# Declare track skipped lines per level for each category
	declare -A SKIPPED_LEADERBOARD
	declare -A SKIPPED_HISTORY
	declare -A SKIPPED_PB

# Total counters across all levels
	TOTAL_SKIPPED_LEADERBOARD=0
	TOTAL_SKIPPED_HISTORY=0
	TOTAL_SKIPPED_PB=0
	TOTAL_SKIPPED_ALL=0

# Example function to load data for a specific level
	load_level_data() {
    local level=$1
    local leaderboard_file="leaderboard_lvl${level}.txt"
    
    local count=0

	local file=""
    case $type in
        "Leaderboard") file="leaderboard_lvl${CURRENT_LEVEL}.txt" ;;
        "History")     file="history_lvl${CURRENT_LEVEL}.txt" ;;
        "Personal Best") file="pb_lvl${CURRENT_LEVEL}.txt" ;;
    esac

    echo "Displaying games for Level $CURRENT_LEVEL:"
    echo "=========================================="

	# personal best only for players line
		best=$(awk -F'|' -v play# Main Menu
	show_menu()
    while true; do
        scan_all_levels
        clear
        echo "=================================================="
        echo "         GAME MENU - CURRENT LEVEL: $CURRENT_LEVEL"
        echo "=================================================="
        
        show_warning_header

        echo "1. Change Level (Current: Level $CURRENT_LEVEL)"
        echo "2. View Leaderboard (Level $CURRENT_LEVEL)"
        echo "3. View History (Level $CURRENT_LEVEL)"
        echo "4. View Personal Best (Level $CURRENT_LEVEL)"
        echo "5. Exit"
        echo "=================================================="


        read -p "Select an option [1-5]: " choice="$name" -v lvl="$level" 
			NF==6 && 
			($2=="easy" || $2=="normal" || $2=="hard") &&
			$5~/^[0-9]+$/ && $6~/^[0-9]+$/ &&
			$1==player && $2==lvl 
			print $5
			 game_history.txt |sort -n | head -1

	# show invalid lines
	awk -F'|' Nf!=6 || ($2!="easy" && $2!="normal" && $2!="hard" game_history.txt

	# Create file if not exists, so progran never crashes
		touch game_history.txt

	# Valid line ckecker: 6 field ,level ok, tries + duration numbers
	is_valid()
	echo "==========Game History (valid only)=========="
	echo "$1" | awk -F'|' NF==6 && ($2=="easy || $2=="normal" || $2=="hard") && $5~/^[0-9]+$/ && $6~/^[0-9]+$/ | grep -q
	
		
        if [[ -z "$best" ]] ; then
            echo ";First valid game on $level level!"
        else
            echo "your personal best on $level is $best tries"
        fi

        if (( $attempt < $best )); then
            echo "new personal best for $level"
        fi

fi 
end_time=$(date "+%y-%m-%d %h:%m:%s")
end_seconds=$(date +%s)
duration=$((end_seconds - start_seconds))


echo "$name|$level|$start_time|$end_time|$tries|$duration" >> game_history.txt
echo "Game saved to game_history.txt"