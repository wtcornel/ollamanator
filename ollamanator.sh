#!/bin/bash

#A bash script to automate making custom models in Ollama.
#By: William Cornell
#This software is licensed under the GNU General Public License v3.0 License.

#Strictly necessary ASCII art welcome message:
tput blink; echo "  ___  _     _        _    __  __    _    _   _    _  _____ ___  ____  ";        tput sgr0
tput blink; echo " / _ \| |   | |      / \  |  \/  |  / \  | \ | |  / \|_   _/ _ \|  _ \ ";        tput sgr0
tput blink; echo "| | | | |   | |     / _ \ | |\/| | / _ \ |  \| | / _ \ | || | | | |_) |";        tput sgr0
tput blink; echo "| |_| | |___| |___ / ___ \| |  | |/ ___ \| |\  |/ ___ \| || |_| |  _ < ";        tput sgr0
tput blink; echo " \___/|_____|_____/_/   \_\_|  |_/_/   \_\_| \_/_/   \_\_| \___/|_| \_\ ";        tput sgr0
tput blink; echo "";        tput sgr0

echo -e "Welcome to the \e[1;31mO\e[0m\e[1;32ml\e[0m\e[1;33ml\e[0m\e[1;34ma\e[0m\e[1;35mm\e[0m\e[1;36ma\e[0m\e[1;31mn\e[0m\e[1;32ma\e[0m\e[1;33mt\e[0m\e[1;34mo\e[0m\e[1;35mr\e[0m."
echo "A bash script to automate making custom models in Ollama."
echo -e "Author: \e]8;;wtcornel@mtu.edu\aWill Cornell\e]8;;\a"
echo ""
echo ""

echo "Press Enter To continue"

#wait till enter
read trash
clear

#collect vars
echo "Please name the model:"
read name
clear

echo "Please pick a local source model: "
echo -e "\e]8;;https://ollama.com/library\aWhere Do I Get A Model?\e]8;;\a"
ollama list

read source
clear

echo "Please enter a 'temperature'(a creativity scale from 0 to 1):"
read temp
clear

echo "Enable Mirostat (perplexity control). (0=disabled, 1=Mirostat, 2=Mirostat 2.0, def 0)"
read miro
clear

echo "Please enter a system prompt:"
read prompt
clear

#write vars to model file:
echo -e "\033[5mGenerating Model File: \033[0m"
echo "###Created with the Ollamanator By Will Cornell##"  >> $name
echo "From $source" >> $name
echo "PARAMETER mirostat $miro" >> $name
echo "PARAMETER temperature $temp" >> $name
echo "SYSTEM $prompt" >> $name

#print model file
cat $name

#make the model
ollama create $name-$source -f ./$name

clear

# Prompt the user for input
read -p "Launch Now? (y/n): " choice

# Check the input
if [ "$choice" = "y" ]; then
    echo "chatting with $name-$source"
	ollama run $name-$source
elif [ "$choice" = "n" ]; then
    echo "Goodbye!"
else
    echo "OOF. Invalid choice. Please enter 'y' or 'n'."
fi
