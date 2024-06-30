#!/usr/bin/env bash

echo "hi"

# Configure NPM.yml file
function configure_npm_yml() {
  local tempYamlFile version resolver deployer

  version="${1}"
  resolver="${2}"

  tempYamlFile=$(mktemp /tmp/temp_yaml.XXXXXX.yml)

  # Create the temporary YAML file with custom parameters
cat <<EOL > "$tempYamlFile"
version: ${version}
type: npm
EOL

  # Output the temporary YAML file path
  echo "Temporary YAML file created at: $tempYamlFile"
  cat "${tempYamlFile}"

  if [[ -n "${resolver}" ]]; then
  awk '
/^type: npm$/ {
    print
    print "resolver:"
    print "    repo: tzahi_npm_remote_test"
    print "    serverId: ghpoc"
    next
}
{ print }
' "$tempYamlFile" > temp.yml && mv temp.yml "$tempYamlFile"
  fi

  cat "${tempYamlFile}"
}

# Configure NPM.yml file
configure_npm_yml "${1}" "${2}"