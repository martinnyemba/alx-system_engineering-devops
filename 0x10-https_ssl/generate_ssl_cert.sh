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

generate_ssl_cert() {
    if [[ $# -eq 0 ]]; then
        echo 'Please provide a domain name as an argument'
        return 1
    fi

    local domain="$1"
    local key_path="/etc/ssl/private/${domain}.key"
    local cert_path="/etc/ssl/certs/${domain}.crt"

    # Check if openssl is installed
    if ! command -v openssl &> /dev/null; then
        echo 'Error: openssl is not installed.'
        return 1
    fi

    # Ensure the directories exist
    if [[ ! -d /etc/ssl/private ]]; then
        echo 'Error: /etc/ssl/private directory does not exist.'
        return 1
    fi

    if [[ ! -d /etc/ssl/certs ]]; then
        echo 'Error: /etc/ssl/certs directory does not exist.'
        return 1
    fi

    # Generate SSL certificate and key
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout "${key_path}" \
        -out "${cert_path}" \
        -subj "/CN=${domain}"

    if [[ $? -eq 0 ]]; then
        echo "SSL certificate and key have been generated successfully:"
        echo "Key: ${key_path}"
        echo "Cert: ${cert_path}"
    else
        echo "Error: Failed to generate SSL certificate and key."
        return 1
    fi
}

# Call the function with the provided argument
generate_ssl_cert "$1"
