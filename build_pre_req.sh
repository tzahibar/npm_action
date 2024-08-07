#!/usr/bin/env bash

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

# Check if JFrog CLI is installed
check_jfrog_cli
# Check if NPM is installed
check_npm