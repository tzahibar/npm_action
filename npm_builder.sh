#!/usr/bin/env bash

# Configure NPM.yml file
function configure_npm_yml() {
  local tempYamlFile version resolver deployer serverId

  version="${1}"
  resolver="${2}"
  deployer="${3}"
  serverId="${4}"

  echo "Configuring NPM.yml file"

  tempYamlFile=$(mktemp /tmp/temp_yaml.XXXXXX.yml)

  # Create the temporary YAML file with custom parameters
cat <<EOL > "$tempYamlFile"
version: ${version}
type: npm
EOL

  # Output the temporary YAML file path
  echo "Temporary YAML file created at: $tempYamlFile"

  if [[ -n "${deployer}" ]]; then
  deployer="deployer:
    repo: tzahi_npm_remote_test
    serverId: ghpoc"

  echo "${deployer}" >> "$tempYamlFile"
  fi

  if [[ -n "${resolver}" ]]; then
  resolver="resolver:
    repo: tzahi_npm_remote_test
    serverId: ghpoc"

  echo "${resolver}" >> "$tempYamlFile"
  fi

  echo "final:"
  cat "${tempYamlFile}"
}

# Configure JFrog server
function configure_jfrog_server() {
  local serverId url accessToken username

  serverId="${1}"
  url="${2}"
  accessToken="${3}"
  username="${4}"

  echo "Configuring JFrog server"

  # Configure JFrog server
  echo "jf c add ${serverId} --artifactory-url=${url} --user=${username} --password=${accessToken}"
  jf c add "${serverId}" --artifactory-url="${url}" --user="${username}" --password="${accessToken}"
}

# Install NPM package using JFrog CLI
function install_npm_package() {
  local buildName buildNumber

  buildName="${1}"
  buildNumber="${2}"

  # Install NPM package using JFrog CLI
  jf npm install --build-name="${buildName}" --build-number="${buildNumber}"
}