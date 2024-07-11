#!/usr/bin/env bash

set -e

echo " _______  _______  ___      __   __  _______  __   __  _______  ______    _______ "
echo "|       ||       ||   |    |  | |  ||       ||  | |  ||   _   ||    _ |  |   _   |"
echo "|    _  ||   _   ||   |    |  |_|  ||       ||  |_|  ||  |_|  ||   | ||  |  |_|  |"
echo "|   |_| ||  | |  ||   |    |       ||       ||       ||       ||   |_||_ |       |"
echo "|    ___||  |_|  ||   |___ |_     _||      _||       ||       ||    __  ||       |"
echo "|   |    |       ||       |  |   |  |     |_ |   _   ||   _   ||   |  | ||   _   |"
echo "|___|    |_______||_______|  |___|  |_______||__| |__||__| |__||___|  |_||__| |__|"
echo ""
echo "Welcome to Polychara's installation script!"
echo "This script will install the required dependencies for Polychara to run."
echo "If anything fails during this stage, please keep the logs and open an issue on github.com/kernelb00t/polychara."

# We will create a function that checks if sudo works with the command given in argument.
# If it does not, we will exit the script.

check_sudo() {
    if $(sudo "$1") -ne 0; then
        echo "This script must be run with a user with at least sudo privileges for $1."
        echo "Please make sure you have the required permissions."
        exit 1
    fi
}

if [[ $(sudo apt >/dev/null) -ne 0 ]]; then
    echo "This script must be run with a user with at least sudo privileges."
    echo "Please make sure you have the required permissions to install packages."
    exit 1
fi

echo "Please make sure you have the required permissions to install packages."
echo "Note: This scripts support auto-installation of Python 3 on Debian-based and RedHat-based OSes only."

# We will first check the presence of Python. If it is not installed, we will install it.
source /etc/os-release
case "$ID" in
    debian|ubuntu)
        echo "Detected Debian-based OS, checking Python3..."
        if ! dpkg -l | grep -q python3; then
            echo "Python 3 not found/not installed with Apt. Installing..."
            check_sudo apt
            sudo apt update
            sudo apt install -y python3
        else
            echo "A Python 3 installation was found. We can go ahead."
        fi
        ;;
    centos|fedora)
        echo "Detected RedHat-based OS, checking Python3..."
        if ! rpm -q python3; then
            if $(command -v dnf >/dev/null); then
                echo "Python 3 not found/not installed with DNF. Installing..."
                check_sudo dnf
                sudo dnf install -y python3
            else
                echo "Python 3 not found/not installed with Yum. Installing..."
                check_sudo yum
                sudo yum install -y python3
            fi
        else
            echo "A Python 3 installation was found. We can go ahead."
        fi
        ;;
    *)  # We have to add support for other OSes. At least instructions...
        echo "Unsupported OS: $ID."
        echo "Please open an issue on github.com/kernelb00t/polychara with this output." 
        exit 1
        ;;
esac

# Now we will create a Venv and install the required packages.
echo "Creating a Python Virtual Environment..."
if [ -d "venv" ]; then
    echo "A Python Virtual Environment already exists. Remove it? [y/N]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        rm -rf venv
        python3 -m venv venv
    else
        echo "Continuing with the existing Virtual Environment."
    fi
else
    python3 -m venv venv
fi
source venv/bin/activate
echo "Installing required Python packages..."
pip install -r requirements.txt
/usr/bin/env python3 main.py install
