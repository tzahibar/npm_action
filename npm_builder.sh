#!/usr/bin/env bash

echo "hi"

# Check if JFrog CLI is installed, if it does print the version, if not exit with error
function check_jfrog_cli() {
    if ! command -v jfrog &> /dev/null; then
        echo "JFrog CLI is not installed. Exiting..."
        exit 1
    fi
    echo "JFrog CLI is installed. Version:"
    jfrog -v
}

# Check if NPM is installed, if it does print the version, if not exit with error
function check_npm() {
    if ! command -v npm &> /dev/null; then
        echo "NPM is not installed. Exiting..."
        exit 1
    fi
    echo "NPM is installed. Version:"
    npm -v
}

#install jfrog cli on ubuntu
function install_jfrog_cli() {
    curl -fL https://install-cli.jfrog.io | sh
}

#install npm on ubuntu
function install_npm() {
    sudo apt install npm
}

install_jfrog_cli
install_npm
jfrog -v