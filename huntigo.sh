#!/usr/bin/env bash


#---------------
warning=" [- \033[31m WARNING\033[0m -]"
info=" [- \033[1;33m info\033[0m -]"
failure=" [- \033[31m FAILED\033[0m -]"
success=" [- \033[1;32m SUCCESS\033[0m -]"
downloading=" \033[32m [\033[0m Downloading    \033[32m]\033[0m\r"&&
extracting=" \033[32m [\033[0m Extracting     \033[32m]\033[0m\r"
mv_bin='\033[32m [\033[0m moving to /bin  \033[32m]\033[0m\r'
apt=" \033[32m [\033[0m Installing using APT \033[32m]\033[0m\r"
don=" \033[32m [\033[0m Done! \033[32m]\033[0m\r"
mak=" \033[32m [\033[0m Building \033[32m]\033[0m\r"
notify=" [\033[32m██\033[0m]"
ark=$(arch)
os=$(awk -F= '$1=="NAME" { print $2 ;}' /etc/os-release | sed 's/"//' | sed 's/"//')
#---------------

function banner(){
    echo -e """
\033[31m

██╗░░██╗██╗░░░██╗███╗░░██╗████████╗██╗░██████╗░░█████╗░
██║░░██║██║░░░██║████╗░██║╚══██╔══╝██║██╔════╝░██╔══██╗
███████║██║░░░██║██╔██╗██║░░░██║░░░██║██║░░██╗░██║░░██║
██╔══██║██║░░░██║██║╚████║░░░██║░░░██║██║░░╚██╗██║░░██║
██║░░██║╚██████╔╝██║░╚███║░░░██║░░░██║╚██████╔╝╚█████╔╝
╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░╚═════╝░░╚════╝░ 

                [v1.0] Happy Hacking
                \033[32m[Developed By RahadSec]\033[0m
\033[0m
    """
}


function installer(){
    pkg=$1
    proc=$2
    if command -v $pkg >/dev/null 2>&1; then
        echo -e "$info  \033[31m*\033[0m[ $pkg is Already Installed ]\033[31m*\033[0m"
    else
        echo -ne "$warning  \033[31m*\033[0m[ $pkg is Not Installed (Installing..) ]\033[31m*\033[0m\n"
        $proc
        echo -ne "$success  \033[31m*\033[0m[ $pkg is Installed Successfully ]\033[31m*\033[0m\n"
    fi

}


function tool_config(){
    echo -e "\n [#] Installing System Requirements ]"
    echo -e "\n [#] Installation Starting..."
    sudo apt-get update -y -qq &>/dev/null
    sudo apt install git -y -qq &>/dev/null
    sudo apt install --assume-yes p7zip-full &>/dev/null
    sudo apt install curl -y -qq &>/dev/null
    sudo apt install wget -y -qq &>/dev/null
    sudo apt install python3 -y -qq &>/dev/null
    sudo apt install python3-pip -y -qq &>/dev/null
    sudo apt install dig -y -qq &>/dev/null
    sudo apt install host -y -qq &>/dev/null
    sudo apt install make -y -qq &>/dev/null
    sudo apt install git -y -qq &>/dev/null
    echo " [#] Tools Configuration Done! [#] "

}

function go_latest(){
    echo -e "\n [#] Go Latest Installation Started..."
    echo -e "\n [#] Installation Starting..."
    echo -e " [#] Wait for few minutes..."
    echo -e "\n [#] Installing Using Apt"
    sudo apt install golang-go -y -qq &>/dev/null
    echo -e "\n [#] Installation Done"
}


function paramspider_latest(){
    echo -e "\n [#] ParamSpider Latest Installation Started..."
    echo -ne $downloading
    git clone https://github.com/devanshbatham/ParamSpider /opt/paramspider &>/dev/null
    sudo pip3 install -r /opt/paramspider/requirements.txt &>/dev/null
    echo -ne $mv_bin
    echo 'python3 /opt/paramspider/paramspider.py $@' >> paramspider
    chmod +x paramspider
    sudo mv paramspider /bin
    echo -e "\n [#] Installation Done"
}


function assetsfinder_latest(){
    echo -e "\n [#] Assetfinder Latest Installation Started..."
    echo -ne $downloading
    go install github.com/tomnomnom/assetfinder@latest
    echo -e "\n [#] Installation Done"
}

function sublist3r_latest(){
    echo -e "\n [#] Sublist3r Latest Installation Started..."
    sudo pip3 install https://github.com/aboul3la/Sublist3r &>/dev/null
    echo -e "\n [#] Installation Done"
}

function amass_latest_kali(){
    echo -e "\n [#] Amass Latest Installation Started..."
    echo -e "\n [#] Installing Using Apt"
    sudo apt install amass -y -qq &>/dev/null
    echo -e "\n [#] Installation Done"
    
}

function massdns_latest_linux(){
    echo -e "\n [#] MassDns Latest Installation Started..."
    mkdir .tmp;cd .tmp
    echo -ne $downloading
    git clone https://github.com/blechschmidt/massdns.git &>/dev/null
    cd massdns
    echo -ne $mak
    make &>/dev/null
    echo -ne $mv_bin
    chmod +x bin/massdns
    sudo mv bin/massdns /bin
    cd ../..
    rm -rf .tmp
    echo -e "\n [#] Installation Done"
}

function massdns_latest_kali(){
    echo -e "\n [#] MassDNS Latest For Kali Installation Started..."
    echo -e "\n [#] Installing Using Apt"
    sudo apt install massdns -y -qq &>/dev/null
    echo -e "\n [#] Installation Done"
}
function puredns_latest(){
    echo -e "\n [#] PureDNS Latest Installation Started..."
    go install github.com/d3mondev/puredns/v2@latest
    echo -e "\n [#] Installation Done"
}

function subfinder_latest_kali(){
    echo -e "\n [#] Subfinder Latest for Kali Installation Started..."
    echo -e "\n [#] Installing Using Apt"
    sudo apt install subfinder -y -qq &>/dev/null
    echo -e "\n [#] Installation Done"
}
function knockpy_latest(){
    echo -e "\n [#] KnockPy Latest Installation Started..."
    echo -ne $downloading
    sudo pip3 install https://github.com/guelfoweb/knock &>/dev/null
    echo -e "\n [#] Installation Done"
}
function masscan_latest_linux(){
    echo -e "\n [#] MasScan Latest Installation Started..."
    mkdir .tmp;cd .tmp
    echo -ne $downloading
    git clone https://github.com/robertdavidgraham/masscan &>/dev/null
    cd masscan
    echo -ne $mak
    make &>/dev/null
    echo -ne $mv_bin
    make install &>/dev/null
    cd ../..
    rm -rf .tmp
    echo -e "\n [#] Installation Done"
}
function masscan_latest_kali(){
    echo -e "\n [#] MasScan Kali Latest Installation Started..."
    echo -e "\n [#] Installing Using Apt"
    sudo apt install masscan -y -qq &>/dev/null
    echo -e "\n [#] Installation Done"
}

function subjack_latest(){
    echo -e "\n [#] Subjack Latest Installation Started..."
    go install github.com/haccer/subjack@latest
    echo -e "\n [#] Installation Done"
}
function otxurls_latest(){
    echo -e "\n [#] otxurls Latest Installation Started..."
    go install github.com/lc/otxurls@latest
    echo -e "\n [#] Installation Done"
}
function subzy_latest(){
    echo -e "\n [#] Subzy Latest Installation Started..."
    go install github.com/lukasikic/subzy@latest
    echo -e "\n [#] Installation Done"
}
function kxss_latest(){
    echo -e "\n [#] Kxss Latest Installation Started..."
    go install github.com/joyghoshs/kxss@latest
    echo -e "\n [#] Installation Done"
}
function subjs_latest(){
    echo -e "\n [#] subjs Latest Installation Started..."
    go install github.com/lc/subjs@latest
    echo -e "\n [#] Installation Done"
}
function gf_latest(){
    echo -e "\n [#] Gf Latest Installation Started..."
    go install github.com/tomnomnom/gf@latest
    cd /root/go/bin
    cp gf /usr/local/bin
    echo -e "\n [#] Installation Done"

}

function waybackurls_latest(){

    echo -e "\n [#] Waybackurls Latest Installation Started..."
    go install github.com/tomnomnom/waybackurls@latest
    cd /root/go/bin
    cp waybackurls /usr/local/bin
    echo -e "\n [#] Installation Done"

}

function nuclei_latest(){
    echo -e "\n [#] Nuclei Latest Installation Started..."
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    echo -e "\n [#] Installation Done"
}

function httpx_latest(){
    echo -e "\n [#] Httpx Latest Installation Started..."
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    echo -e "\n [#] Installation Done"
}

function httprobe_latest(){
    echo -e "\n [#] Httprobe Latest Installation Started..."
    go install -v github.com/tomnomnom/httprobe@latest
    echo -e "\n [#] Installation Done"
}

function dalfox_latest(){
    echo -e "\n [#] Dalfox Latest Installation Started..."
    go install github.com/hahwul/dalfox/v2@latest
    echo -e "\n [#] Installation Done"
}


function all_install(){
    go_latest
    paramspider_latest
    assetsfinder_latest
    sublist3r_latest
    amass_latest_kali
    massdns_latest_linux
    massdns_latest_kali
    puredns_latest
    subfinder_latest_kali
    knockpy_latest
    masscan_latest_linux
    masscan_latest_kali
    subjack_latest
    otxurls_latest
    subzy_latest
    kxss_latest
    subjs_latest
    gf_latest
    waybackurls_latest
    nuclei_latest
    httpx_latest
    httprobe_latest
    dalfox_latest
    
}


banner
echo " [#] Do You Want To Install All Bug Hunting Tools In One Click? (Y/N) [#] "
printf " Enter Your Option: "
read userInput

if [ "$userInput" != "${userInput#[Yy]}" ] ;then
    all_install
else
    echo "[#] Okay! See You Again!"
    echo "[#] Happy Hacking! "
    echo "[#] Bye!"
fi




