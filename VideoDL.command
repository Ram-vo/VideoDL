#!/bin/bash

#  VideoDL
#
#  Created by Ramon Valdes on 2020-03-14.
#  Copyright © 2020 Ramon Valdes. All rights reserved.

VERSION=1.0.2

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

bigTit () {
    echo ""
    echo -e "${GRN}██╗   ██╗██╗██████╗ ███████╗ ██████╗ ${NC}    ${RED}█████████╗ ██╗     ${NC}";
    echo -e "${GRN}██║   ██║██║██╔══██╗██╔════╝██╔═══██╗${NC}    ${RED}╚══██╔══██╗██║     ${NC}";
    echo -e "${GRN}██║   ██║██║██║  ██║█████╗  ██║   ██║${NC}█████╗ ${RED}██║  ██║██║     ${NC}";
    echo -e "${GRN}╚██╗ ██╔╝██║██║  ██║██╔══╝  ██║   ██║${NC}╚════╝ ${RED}██║  ██║██║     ${NC}";
    echo -e "${GRN} ╚████╔╝ ██║██████╔╝███████╗╚██████╔╝${NC}       ${RED}██████╔╝███████╗${NC}";
    echo -e "${GRN}  ╚═══╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝ ${NC}       ${RED}╚═════╝ ╚══════╝${NC}";
    echo "                                                                                     ";
    echo ""
}

credit () {
    echo -e "*********************************************************************"
    echo -e "*                                                                   *"
    echo -e "*                    ${B}VideoDL v${VERSION} by ${RED}@MrRaymondVO${NC}                 *"
    echo -e "*                                                                   *"
    echo -e "*  ${B}Watch and star on GitHub to stay updated with upcoming releases  *"
    echo -e "*                                                                   *"
    echo -e "*        ${undcyn}https://github.com/MrRaymondVO/VideoDL/releases/${NC}           *"
    echo -e "*                                                                   *"
    echo -e "*********************************************************************"
    echo ""
}

patreon () {
    echo "https://www.patreon.com/mrraymond"
}


printHelp () {
    echo -e "${bldgrn}"
    echo -e "--------------------------------------------------------------------------------"
    echo -e "${bldgrn}Help${NC}"
    echo -e ""
    echo -e "${undcyn}On Start${NC}"
    echo -e "When the program starts you have the possibility of download a video quickly without any extra steps. You just have to copy the link of the video you want to download and paste it in the terminal and press enter. Below you will see how the video download starts to run."
    echo -e "${undcyn}Full Install${NC}"
    echo -e "It does a complete installation of all the necessary tools. You may be asked for the administrator password at some point durning the installation"
    echo -e ""
    echo -e "${undcyn}Command Line Tools${NC}"
    echo -e "Download the macOS SDK, headers, and build tools such as the Apple LLVM compiler and Make. These tools make it easy to install open source software or develop on UNIX within Terminal. macOS can automatically download these tools the first time you try to build software, and they are available on the downloads page."
    echo -e ""
    echo -e "${undcyn}Homebrew${NC}"
    echo -e "Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's macOS operating system and Linux. The name is intended to suggest the idea of building software on the Mac depending on the user's taste. "
    echo -e "${bldgrn}"
    echo -e ""
    echo -e "${undcyn}YouTube-DL${NC}"
    echo -e "youtube-dl is a command-line program to download videos from YouTube.com and a few more sites. It requires the Python interpreter, and it is not platform specific. We also provide a Windows executable that includes Python. youtube-dl should work in your Unix box, in Windows or in Mac OS X."
    echo -e "${bldgrn}"
    echo -e ""
    echo -e "${undcyn}FFMpeg${NC}"
    echo -e "FFmpeg is a free and open-source project consisting of a vast software suite of libraries and programs for handling video, audio, and other multimedia files and streams. At its core is the FFmpeg program itself, designed for command-line-based processing of video and audio files, and widely used for format transcoding, basic editing like trimming and concatenation, video scaling, video post-production effects, and standards compliance SMPTE, ITU."
    echo -e "${bldgrn}"
    echo -e "--------------------------------------------------------------------------------"
    echo -e "${NC}"
    echo -e "Press ${bldgrn}1${NC} to ${undgrn}continue${NC} or any other key for ${bldred}Quit: ${NC}"
    read next
    if [ $next = 1 ]; then
        listToolsEn
    elif [ $next = 2 ]; then
        main
    else
        exit
    fi
}

processCompleted () {
    if [[ $? > 0 ]]; then
        error
    else
        echo -e "${GRN}"
        echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
        echo "|                 P r o c e s s   C o m p l e t e d                 |";
        echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
        echo -e "${NC}"
    fi
}

downloadCompleted () {
    if [[ $? > 0 ]]; then
        error
    else
        echo -e "${GRN}"
        echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
        echo "|               D o w n l o a d   C o m p l e t e d                 |";
        echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
        echo -e "${NC}"
    fi
}

error () {
    echo -e "${RED}"
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
    echo "|                             E R R O R                             |";
    echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
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
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

# DL
# Fast Download
fastDl () {
    echo -e "${NC}"
    echo -e "Paste the ${undwht}link of the video${NC} or type ${bldgrn}1${NC} to choose ${bldcyn}another option${NC}: ${bldgrn}"
    read -e -p "=> " url
    echo -e "${NC}"
    if [[ $url = 1 ]]; then
        main
    else
        command youtube-dl ${url}
        downloadCompleted
    fi
    fastDl
}
# Config
configOutput () {
    echo -e "${NC}Drop the output default folder you want to set here: ${bldgrn}"
    read -e -p "=> " FILEPATH
    echo -e "${NC}"
    command mkdir -p ~/.config/youtube-dl/
    echo "-o $FILEPATH/%(title)s-%(id)s.%(ext)s" > ~/.config/youtube-dl/config
    processCompleted
}

# Video Selection
playlistMenu () {
    echo -e "${bldgrn}"
    echo "Playlist Download Options";
    echo -e "${NC}"
    echo -e "${GRN}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Download Full Playlist"
        "Download a range of videos on the Playlist"
        "Download specific videos on the Playlist"
        "Help"
        "Quit"
        )
    select opt in "${options[@]}"
    do
        case $opt in
            "Download Full Playlist")
                playlistFullDl
                break
                ;;
            "Download a range of videos on the Playlist")
                playlistRangeDl
                break
                ;;
            "Download specific videos on the Playlist")
                playlistItemsDl
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
# Download full playlist
playlistFullDl () {
    echo ""
    echo -e "Paste the ${undwht}link of the playlist${NC} or a ${undwht}video in the playlist${bldgrn}"
        read -e -p "=> " url
        echo -e "${NC}"
        if [[ $url = 1 ]]; then
            playlistMenu
        else
            command youtube-dl --yes-playlist ${url}
            downloadCompleted
        fi
}
# Download range
playlistRangeDl () {
    echo ""
    echo -e "Paste the ${undwht}link of the playlist${NC} or a ${undwht}video in the playlist${bldgrn}"
        read -e -p "=> " url
        echo -e "${NC}"
        if [[ $url = 1 ]]; then
            playlistMenu
        else
            echo -e "${bldylw}Enter the range on the Playlist${NC}"
            echo -e "Start at: ${bldgrn}"
            read -e -p "leave blank to start for the firt video => " START
            echo -e "${NC}"
            echo -e "End at: ${bldgrn}"
            read -e -p "leave blank to download all tothe last => " END
            echo -e "${NC}"
            command youtube-dl --playlist-start "$START" --playlist-end "$END" ${url}
            downloadCompleted
        fi
}
# Download indexes
playlistItemsDl () {
    echo ""
    echo -e "Paste the ${undwht}link of the playlist${NC} or a ${undwht}video in the playlist${bldgrn}"
        read -e -p "=> " url
        echo -e "${NC}"
        if [[ $url = 1 ]]; then
            playlistMenu
        else
            echo -e "${NC}Specify indices of the videos in the playlist separated by commas like: ${bldylw}1,2,5,8${NC} if you want to download videos indexed ${bldgrn}1, 2, 5, 8${NC} in the playlist."
            echo -e "${NC}You can specify range: ${bldylw}1-3,7,10-13${NC} it will download the videos at index ${bldgrn}1, 2, 3, 7, 10, 11, 12 ${NC}and ${bldgrn}13${NC}."
            echo -e "Start at: ${bldgrn}"
            read -e -p "=> " ITEMS
            echo -e "${NC}"
            command youtube-dl --playlist-items "$ITEMS" ${url}
            downloadCompleted
        fi
}


# Download Menu
downloadMenu () {
    echo -e "${GRN}"
    echo "+-+-+-+-+-+-+-+-+";
    echo "| Download Menu |";
    echo -e "+-+-+-+-+-+-+-+-+${NC}";
    echo -e "${bldgrn}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Fast Download"
        "Set Default Download Location"
        "Download Playlist"
        "Help"
        "Quit"
        )
    select opt in "${options[@]}"
    do
        case $opt in
        
            "Fast Download")
                fastDl
                downloadMenu
                ;;
            
            "Set Default Download Location")
                configOutput
                downloadMenu
                ;;

            "Download Playlist")
                playlistMenu
                downloadMenu
                ;;
            
            "Help")
                printHelp
                downloadMenu
                ;;
            
            "Quit")
                banner -w 28 "Bye Bye"
                exit
                ;;
                
            *) echo -e "${RED}invalid option${CY} $REPLY";;
        esac
    done
}



installMenu () {
    echo -e "${GRN}"
    echo "+-+-+-+-+-+-+-+-+";
    echo "| Install  Menu |";
    echo -e "+-+-+-+-+-+-+-+-+${NC}";
    echo -e "${GRN}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Full Install"
        "Install Command Line Tools"
        "Install Homebrew"
        "Install YouTube-Dl"
        "Install FFMpeg"
        "Help"
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
            
            "Help")
                printHelp
                break
                ;;
            
            "Quit")
                banner -w 28 "Bye Bye"
                exit
                ;;
                
            *) echo -e "${RED}invalid option${CY} $REPLY";;
        esac
    done
}

main () {
    echo ""
    echo -e "${GRN}Chose an option${CY}"
    PS3='Enter your choice: '
    options=(
        "Download Menu"
        "Install Dependencies"
        "Help"
        "Quit"
        )
    select opt in "${options[@]}"
    do
        case $opt in
        
            "Download Menu")
                downloadMenu
                break
                ;;
            
            "Install Dependencies")
                installMenu
                break
                ;;
            
            "Help")
                printHelp
                break
                ;;
            
            "Quit")
                banner -w 28 "Bye Bye"
                exit
                ;;
                
            *) echo -e "${RED}invalid option${CY} $REPLY";;
        esac
    done
}

bigTit
credit
fastDl
main
