#!/bin/bash

# Function to install docker
install_docker() {
  sudo apt-get update
  sudo apt-get install -y docker.io
}

# Function to install docker-compose
install_docker_compose() {
  sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

# Function to install GitLab Runner
install_gitlab_runner() {
  sudo apt-get update
  sudo apt-get install -y curl
  curl -L https://packages.gitlab.com/install/repositories/gitlab/gitlab-runner/debian/stretch/main/gitlab-runner-stretch.deb | sudo dpkg -i -
  sudo apt-get update
  sudo apt-get install -y gitlab-runner
}

# Function to install git, curl, wget if not installed
install_git_curl_wget() {
  sudo apt-get update
  sudo apt-get install -y git curl wget
}

# Function to install Node.js
install_nodejs() {
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

# Function to install npm
install_npm() {
  sudo apt-get install -y npm
}

# Function to update the server
update_server() {
  sudo apt-get update && sudo apt-get upgrade -y
}

# Function to add gitlab-runner and docker users to sudo group
add_to_sudo() {
  sudo usermod -aG sudo gitlab-runner docker
}

# Main script execution
install_docker
install_docker_compose
install_gitlab_runner
install_git_curl_wget
install_nodejs
install_npm
update_server
add_to_sudo