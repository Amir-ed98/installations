#!/bin/bash

# Define R and RStudio version
RSTUDIO_VERSION="2024.12.0-402"

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install dependencies
echo "Installing required dependencies..."
sudo apt install -y software-properties-common dirmngr \
    libclang-dev libssl-dev libcurl4-openssl-dev libxml2-dev \
    build-essential libfontconfig1-dev libfreetype6-dev \
    libharfbuzz-dev libfribidi-dev libpng-dev libtiff5-dev libjpeg-dev

# Add the CRAN GPG key
echo "Adding CRAN GPG key..."
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee /etc/apt/keyrings/cran_ubuntu_key.asc > /dev/null

# Add the CRAN repository
echo "Adding CRAN repository for R..."
echo "deb [signed-by=/etc/apt/keyrings/cran_ubuntu_key.asc] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee /etc/apt/sources.list.d/cran-r.list

# Update package list again
sudo apt update -y

# Install R
echo "Installing R..."
sudo apt install -y r-base r-base-dev

# Verify R installation
echo "R version:"
R --version

# Download and Install RStudio
echo "Downloading RStudio..."
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-${RSTUDIO_VERSION}-amd64.deb -O rstudio.deb

echo "Installing RStudio..."
sudo dpkg -i rstudio.deb || sudo apt --fix-broken install -y

# Fix RStudio sandbox issue
echo "Fixing RStudio sandbox permissions..."
sudo chmod 4755 /usr/lib/rstudio/chrome-sandbox
sudo chown root:root /usr/lib/rstudio/chrome-sandbox

# Cleanup
echo "Cleaning up..."
rm -f rstudio.deb

# Verify RStudio installation
echo "RStudio installed successfully! Run it using: rstudio"

