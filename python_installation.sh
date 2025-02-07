#!/bin/bash

# Define the Python versions to install
PYTHON_VERSIONS=("3.8" "3.9" "3.10" "3.11" "3.12")

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y software-properties-common curl wget make build-essential \
    libssl-dev libffi-dev libsqlite3-dev zlib1g-dev libbz2-dev libreadline-dev \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev liblzma-dev

# Add Deadsnakes PPA for older Python versions (if needed)
echo "Adding Deadsnakes PPA for additional Python versions..."
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update -y

# Install the requested Python versions
for VERSION in "${PYTHON_VERSIONS[@]}"; do
    echo "Installing Python $VERSION..."
    sudo apt install -y python$VERSION python$VERSION-venv python$VERSION-dev python$VERSION-distutils
done

# Configure update-alternatives for Python
echo "Configuring update-alternatives for Python..."
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
for VERSION in "${PYTHON_VERSIONS[@]}"; do
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python$VERSION 10
done

# Set default Python version (Change "3.12" if you want another version)
DEFAULT_PYTHON="3.12"
echo "Setting default Python version to $DEFAULT_PYTHON..."
sudo update-alternatives --set python /usr/bin/python$DEFAULT_PYTHON

# Verify default Python version
python --version

# Install pip for each Python version
for VERSION in "${PYTHON_VERSIONS[@]}"; do
    echo "Installing pip for Python $VERSION..."
    curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python$VERSION
done

# Verify pip installation
pip --version

# Create virtual environments for each version
echo "Creating virtual environments for each Python version..."
mkdir -p ~/python_envs
for VERSION in "${PYTHON_VERSIONS[@]}"; do
    python$VERSION -m venv ~/python_envs/py$VERSION
done

echo "Installation complete! Installed Python versions:"
python --version
ls ~/python_envs

echo "Use 'source ~/python_envs/py<VERSION>/bin/activate' to activate a virtual environment."
