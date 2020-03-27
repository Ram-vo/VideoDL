#!/bin/bash

#  MacCommandToolsCLT.command
#  MacCommandTools
#
#  Created by Ramon Valdes on 2020-03-14.
#  Copyright © 2020 Ramon Valdes. All rights reserved.

NC="\033[0;00m";
RED='\033[0;31m';
GRN='\033[0;32m';
BLU='\033[0;34m';
YLL='\033[01;33m';
PRP='\033[01;35m';
CY='\033[01;36m';
WT='\033[01;37m';
B='\033[1m';
UL='\033[4m';

bldblk='\033[1;30m'; # Black - Bold
bldred='\033[1;31m'; # Red
bldgrn='\033[1;32m'; # Green
bldylw='\033[1;33m'; # Yellow
bldblu='\033[1;34m'; # Blue
bldpur='\033[1;35m'; # Purple
bldcyn='\033[1;36m'; # Cyan
bldwht='\033[1;37m'; # White
unkblk='\033[4;30m'; # Black - Underline
undred='\033[4;31m'; # Red
undgrn='\033[4;32m'; # Green
undylw='\033[4;33m'; # Yellow
undblu='\033[4;34m'; # Blue
undpur='\033[4;35m'; # Purple
undcyn='\033[4;36m'; # Cyan
undwht='\033[4;37m'; # White

echo ""
echo -e "${GRN}██╗   ██╗██╗██████╗ ███████╗ ██████╗ ${NC}    ${RED}█████████╗ ██╗     ${NC}";
echo -e "${GRN}██║   ██║██║██╔══██╗██╔════╝██╔═══██╗${NC}    ${RED}╚══██╔══██╗██║     ${NC}";
echo -e "${GRN}██║   ██║██║██║  ██║█████╗  ██║   ██║${NC}█████╗ ${RED}██║  ██║██║     ${NC}";
echo -e "${GRN}╚██╗ ██╔╝██║██║  ██║██╔══╝  ██║   ██║${NC}╚════╝ ${RED}██║  ██║██║     ${NC}";
echo -e "${GRN} ╚████╔╝ ██║██████╔╝███████╗╚██████╔╝${NC}       ${RED}██████╔╝███████╗${NC}";
echo -e "${GRN}  ╚═══╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝ ${NC}       ${RED}╚═════╝ ╚══════╝${NC}";
echo "                                                                            ";
echo ""

echo -e "**********************************"
echo -e "*                                *"
echo -e "*  ${B}Video Thief by ${RED}@MrRaymondVO${NC}  *"
echo -e "*                                *"
echo -e "**********************************"
echo ""

processCompleted () {
    echo -e "${GRN}"
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo "|P r o c e s s   C o m p l e t e d|";
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo -e "${NC}"
}

downloadCompleted () {
    echo -e "${GRN}"
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo "|D o w n l o a d   C o m p l e t e d|";
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo -e "${NC}"
}

instCLT () {
    echo -e "${GRN}Installing Xcode Command Line Tools${NC}"
    echo ""
    command xcode-select --install
}

instBrew () {
    echo -e "${GRN}Installing Homebrew${NC}"
    echo ""
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
}

instYTDL () {
    echo -e "${GRN}Installing ${RED}Youtube-dl${NC}"
    echo "Wait until the install finishes"
    echo "This culd take a while. Be patient"
    command brew install youtube-dl
}

instFFMPEG () {
    echo -e "${GRN}Installing ${RED}Youtube-dl${NC}"
    echo "Wait until the install finishes"
    echo "This culd take a while. Be patient"
    command brew install ffmpeg
}

fastDl () {
    echo ""
    echo -e "Paste the link or type ${bldylw}N${NC} to choose ${bldcyn}another option${NC}: "
    read -e -p "" url
    if [[ $next = "n" ]]; then
        main
    else
        command youtube-dl ${url}
    fi
    downloadCompleted
    main
}

main () {
    echo ""
    echo -e "${GRN}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Full Install"
        "Install Command Line Tools"
        "Install Homebrew"
        "Install YouTube-Dl"
        "Install FFMpeg"
        "Use YouTube-Dl to download a video"
        "Quit"
        )
    select opt in "${options[@]}"
    do
        case $opt in
            "Full Install")
                    instCLT
                    instBrew
                    instYTDL
                    instFFMPEG
                    processCompleted
                    main
                break
                ;;
                
            "Install Command Line Tools")
                instCLT
                processCompleted
                main
            break
            ;;
            
            "Install Homebrew")
                instBrew
                processCompleted
                main
            break
            ;;
            
            "Install YouTube-Dl")
                instYTDL
                processCompleted
                main
            break
            ;;
            
            "Install FFMpeg")
                instFFMPEG
                processCompleted
                main
            break
            ;;
            
            "Use YouTube-Dl to download a video")
                fastDl
                processCompleted
                main
            break
            ;;
                
            "Quit")
                banner -w 28 "Bye Bye"
                exit
                ;;
                
            *) echo "invalid option $REPLY";;
        esac
    done
}

fastDl
main
