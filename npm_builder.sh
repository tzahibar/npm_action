#!/usr/bin/env bash

echo "hi"

# Configure NPM.yml file
function configure_npm_yml() {
  local tempYamlFile

  tempYamlFile=$(mktemp /tmp/temp_yaml.XXXXXX.yml)

  # Create the temporary YAML file with custom parameters
cat <<EOL > "$tempYamlFile"
version: 123
type: npm
resolver:
    repo: tzahi_npm_remote_test
    serverId: ghpoc
EOL

  # Output the temporary YAML file path
  echo "Temporary YAML file created at: $tempYamlFile"
  cat "${tempYamlFile}"
}

# Configure NPM.yml file
configure_npm_yml