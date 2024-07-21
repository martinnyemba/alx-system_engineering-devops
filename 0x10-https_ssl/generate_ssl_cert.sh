#!/usr/bin/env bash

# Generate a self-signed SSL certificate for the server
# Function to generate a self-signed SSL certificate for a given domain name.
# The generated certificate will be valid for 365 days.
#
# Usage: generate_ssl_cert <domain_name>
#
# Arguments:
#   <domain_name>: The domain name for which the SSL certificate should be generated.
#
# Returns:
#   0: If the SSL certificate is successfully generated.
#   1: If no domain name is provided as an argument.
#
# Example:
#   generate_ssl_cert example.com
#
# Dependencies:
#   - openssl: The OpenSSL command-line tool must be installed on the system.
#
generate_ssl_cert() {
    if [[ $# -eq 0 ]] ; then
        echo 'Please provide a domain name as an argument'
        return 1
    fi

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/"$1".key \
        -out /etc/ssl/certs/"$1".crt \
        -subj "/CN=$1"
}