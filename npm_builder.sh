#!/usr/bin/env bash

echo "hi"

# Configure NPM.yml file
function configure_npm_yml() {
  local filePath

  filePath='.jfrog/projects/npm.yaml'
  # Update the version to 1.0.0
  sed -i 's/^version: .*/version: 1.0.0/' "${filePath}"
  cat "${filePath}"
}

# Configure NPM.yml file
configure_npm_yml