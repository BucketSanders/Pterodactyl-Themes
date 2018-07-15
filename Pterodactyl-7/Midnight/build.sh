#!/bin/bash

if [ ! -f "artisan" ]; then
    echo "Could not find the Artisan file, this normally means you are not in the correct directory! Please go to the root installation of your panel and re-run this script! Thanks"

    else

    echo "You seem to be in the right directory. Continuing setup..."
    sleep 2

    echo "Ensuring GIT is installed..."
    sleep 1
    apt install git zip -y

    echo "Backing up previous panel files in case of errors..."
    zip -r PanelBackup-$(date +"%Y-%m-%d").zip public resources

    echo "Downloading your theme..."
    mkdir -p tempdown && cd tempdown && git clone https://github.com/BucketSanders/Pterodactyl-Themes.git . 
    cp -r Pterodactyl-7/Midnight/public ..
    cp -r Pterodactyl-7/Midnight/resources ..

    echo "Files download complete."
    sleep 2

    echo "Removing the temp folders created in the copy process..."

    cd .. && rm -rf tempdown

    echo "Theme installation complete! Thanks for using HexaneNetworks themes!"
fi
