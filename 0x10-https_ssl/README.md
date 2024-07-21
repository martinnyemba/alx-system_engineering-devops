# HTTPS SSL
![SSL/TLS Termination](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/276/FlhGPEK.png)

#

## HTTPS and SSL/TLS Termination with HAProxy on Ubuntu 16.04

This guide will walk you through the process of setting up HTTPS and SSL/TLS termination with HAProxy on Ubuntu 16.04. HTTPS is the secure version of HTTP, and SSL/TLS is the protocol used to secure internet communication. SSL/TLS termination is the process of decrypting SSL/TLS traffic at the load balancer and then forwarding the decrypted traffic to the backend servers.

## What is HTTPS?

HTTPS (Hypertext Transfer Protocol Secure) is a protocol for secure communication over the internet. HTTPS encrypts data sent between a client (such as a web browser) and a server, ensuring that the data cannot be intercepted or tampered with by a third party. HTTPS is widely used to secure online transactions, such as e-commerce and online banking.

## What are the Two Main Elements that SSL Provides?

SSL (Secure Sockets Layer) provides two main elements: encryption and authentication. 
- **Encryption** ensures that data is protected from interception and tampering during transmission.
- **Authentication** ensures that the client is communicating with the intended server, and not a malicious third party.

## HAProxy SSL Termination on Ubuntu 16.04

HAProxy is a free and open-source load balancer and proxy server that can be used to terminate SSL/TTLS traffic. SSL/TLS termination with HAProxy allows you to offload SSL/TLS decryption to the load balancer, freeing up resources on your backend servers. This can improve performance and scalability, especially for high-traffic websites.

### Steps to Configure SSL Termination with HAProxy on Ubuntu 16.04

1. **Install HAProxy:**
   ```bash
   sudo apt-get update && sudo apt-get install haproxy
   ```

2. **Generate SSL Certificate and Key:**
   ```bash
   sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/example.com.key -out /etc/ssl/certs/example.com.crt
   ```

3. **Configure HAProxy to Terminate SSL/TLS Traffic:**
   Edit the HAProxy configuration file `/etc/haproxy/haproxy.cfg` to include the following lines:
   ```haproxy
   frontend https-in
       bind *:443 ssl crt /etc/ssl/certs/example.com.crt
       default_backend servers

   backend servers
       server server1 192.168.1.1:80
       server server2 192.168.1.2:80
   ```

4. **Restart HAProxy:**
   ```bash
   sudo systemctl restart haproxy
   ```

With these steps, HAProxy will now terminate SSL/TLS traffic at the load balancer and forward decrypted traffic to the backend servers.

## Bash Function for Generating SSL Certificates

To simplify the process of generating SSL certificates, you can use the following Bash function:
```bash
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
```

This function takes a domain name as an argument and generates an SSL certificate and key in the `/etc/ssl/private` and `/etc/ssl/certs` directories, respectively.

To use the function, simply run:
```bash
generate_ssl_cert example.com
```
(replacing `example.com` with your desired domain name).

## Tasks

* **0. World Wide Web**
  * [0-world_wide_web](./0-world_wide_web): Bash script that displays information about subdomains on my configured servers.
  * **Usage:** `./0-world_wide_web <domain> <subdomain>`
  * **Output:** `The subdomain [SUB_DOMAIN] is a [RECORD_TYPE] record and points to [DESTINATION]`
  * If no `subdomain` parameter is passed, displays information about the subdomains `www`, `lb-01`, `web-01`, and `web-02`, in that order.

* **1. HAproxy SSL Termination**
  * [1-haproxy_ssl_termination](./1-haproxy_ssl_termination): HAproxy configuration file that accepts encrypted SSL traffic for the subdomain `www.` on TCP port 443.

* **2. No Loophole in Your Website Traffic**
  * [100-redirect_http_to_https](./100-redirect_http_to_https): HAproxy configuration file that automatically redirects HTTP traffic to HTTPS.

## Requirements

- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass Shellcheck (version 0.3.7) without any error
- The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
- The second line of all your Bash scripts should be a comment explaining what the script is doing

## Author

[Martin Nyemba](mailto:martinnyemba@gmail.com)