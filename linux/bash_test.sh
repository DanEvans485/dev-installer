#!/bin/bash

echo
echo "Teedev Installer"
echo

echo "Select your OS:"
options=(
  "Windows 10"
  "Ubuntu"
  "Arch Linux"
  "CentOs"
)

select OS in "${options[@]}"
do
  echo
  echo "Installing Teedev for $OS..."

  case $OS in
    "Windows 10")
      echo "No installer found for Windows 10"
      break
      ;;
    "Ubuntu")
      sudo apt-get update
      sudo apt-get install -y git
      sudo apt-get install -y docker

      git version
      docker --version

      sudo systemctl enable docker
      sudo systemctl start docker

      docker volume create portainer-data
      docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer-data:/data portainer/portainer

      break
      ;;
    "Arch Linux")
      sudo pacman -Syu
      sudo pacman -S git --noconfirm
      sudo pacman -S docker --noconfirm

      git version
      docker --version

      sudo systemctl enable docker
      sudo systemctl start docker

      docker volume create portainer-data
      docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer-data:/data portainer/portainer

      break
      ;;
    "CentOs")
      echo "No installer found for CentOs"
      break
      ;;
    *) echo "Invalid option $REPLY";;
  esac
done

echo "Teedev Installed"
