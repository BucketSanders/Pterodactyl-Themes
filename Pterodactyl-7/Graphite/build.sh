#!/bin/bash

if [ ! -f "artisan" ]; then
    echo "Could not find the Artisan file, this normally means you are not in the correct directory! Please go to the root installation of your panel and re-run this script! Thanks"

    else
    
    echo "Welcome to the HexaneNetworks theme installer!"
    echo "You seem to be in the right directory, continuing installation..."
    sleep 2

    echo "Ensuring GIT installation..."
    sleep 1
    apt install git zip -y

    echo "Backing up old panel files for redundancy..."
    zip -r PanelBackup-$(date +"%Y-%m-%d").zip public resources

    echo "Downloading the custom theme..."
    mkdir -p tempdown && cd tempdown && git clone https://github.com/BucketSanders/Pterodactyl-Themes.git . 
    cp -r Pterodactyl-7/Graphite/public ..
    cp -r Pterodactyl-7/Graphite/resources ..

    echo "Files have been applied"
    sleep 2

    echo "Removing the temp folders created in the copy process..."

    cd .. && rm -rf tempdown

    echo "Installation complete, clear your browser cache and enjoy your new theme!"
fi
