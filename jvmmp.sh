#!/bin/bash
echo "Verifying file existence..."

# ---- memory allocation ----
JVMOpts="-Xmx1024M -Xms512M"

# ---- File location: default version 1.0 nbsjava1 ----
file="nbsjava1.jar"

if [ -f "$file" ]; then
    echo "File exists. Checking Java installation..."
    java --version > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Java installed!"
        echo "Allocated Java Memory: 1 Gigabyte"
        echo "If you want to change it, change in this file."
        echo "The Program is ready to start! Press any key to start"
        read -n 1 -s
        clear
        echo "Executing program..."
        java $JVMOpts -jar "$file"
        echo -e "\n\nProgram execution completed!"
        echo "Press any key to exit"
        read -n 1 -s
    else
        echo "Java not installed."
        echo "Java is the REQUIRED program to run this."
        echo "Install at least Java 8."
        echo "Press any key to exit."
        read -n 1 -s
        exit 1
    fi
else
    echo "The file $file does not exist."
    exit 1
fi
