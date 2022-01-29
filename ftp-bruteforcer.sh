#! /bin/bash
echo -e "\e[97;101mFILE TRANSFER PROTOCOL BRUTEFORCE TOOL BASED ON NMAP \e[0m" 
echo -e "\e[33mPrerequisites: nmap  gzip \e[0m"
echo -e "Auth:  \e[95mPurpl3Dev \e[0m"
echo -e "\e[91m NOTE: Make sure you have wordlists! \e[0m"
echo -e "If you dont have one check our recommended: \e[38;5;82mhttps://bit.ly/3JyARYc]"
echo -e "\e[97;101mDo not use this script with malicious intentions, remember that nothing on the web is completely untraceable. \e[0m"
echo " "
#nmap

if ! command -v nmap  &> /dev/null
then
    echo "nmap is not installed"

 read -r -p "Would you like to install it? [y/N] " response
 case "$response" in
   [yY][eE][sS]|[yY]) 
        do_something
        sudo apt update && sudo apt upgrade && sudo apt-get install nmap -y
    
        do_something_else
        ;;
esac


    exit
fi

#gzip

if ! command -v gzip  &> /dev/null
then
    read -r -p "Would you like to install it? (DEBIAN/UBUNTU distro) [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            sudo apt install gzip
            false
            ;;
    esac

fi
#password list


FILE=/usr/share/wordlists/rockyou.txt
if test -f "$COMP"; then
echo "wordlist found at /usr/share/wordlists/rockyou.txt"
fi 

if [[ ! -f /usr/share/wordlists/rockyou.txt ]]
then
    echo "/usr/share/wordlists/rockyou.txt does not exist on your filesystem."
fi


#custom path wordlist:

read -r -p "Would you like to import a rockyou.txt file? (default on /usr/share/wordlists/rockyou.txt) [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    
	echo "Paste here yout custom file path:"
           read -r  PASSWORD

else
	PASSWORD="${1:/usr/share/wordlists/rockyou.txt}"
fi



#set var/output

echo "Target ip:"
read -r IP
echo "User / User list file"
read USER

echo -e "All done, starting script:"


nmap --script ftp-brute -p21 $IP  --script-args userdb=$USER,passdb=$PASSWORD
