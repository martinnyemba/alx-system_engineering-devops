# HTTPS SSL

## HTTPS and SSL/TLS Termination with HAProxy on Ubuntu 16.04
This guide will walk you through the process of setting up HTTPS and SSL/TLS termination with HAProxy on Ubuntu 16.04. HTTPS is the secure version of HTTP, and SSL/TLS is the protocol used to secure internet communication. SSL/TLS termination is the process of decrypting SSL/TLS traffic at the load balancer, and then forwarding the decrypted traffic to the backend servers.

## What is HTTPS?
HTTPS (Hypertext Transfer Protocol Secure) is a protocol for secure communication over the internet. HTTPS encrypts data sent between a client (such as a web browser) and a server, ensuring that the data cannot be intercepted or tampered with by a third party. HTTPS is widely used to secure online transactions, such as e-commerce and online banking.

## What are the 2 main elements that SSL is providing?
SSL (Secure Sockets Layer) provides two main elements: encryption and authentication. Encryption ensures that data is protected from interception and tampering during transmission. Authentication ensures that the client is communicating with the intended server, and not a malicious third party.

## HAProxy SSL Termination on Ubuntu 16.04
HAProxy is a free and open-source load balancer and proxy server that can be used to terminate SSL/TLS traffic. SSL/TLS termination with HAProxy allows you to offload SSL/TLS decryption to the load balancer, freeing up resources on your backend servers. This can improve performance and scalability, especially for high-traffic websites.

* To configure SSL termination with HAProxy on Ubuntu 16.04, follow these steps:

Install HAProxy: sudo apt-get update && sudo apt-get install haproxy
Generate SSL certificate and key: sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/example.com.key -out /etc/ssl/certs/example.com.crt
Configure HAProxy to terminate SSL/TLS traffic: Edit the HAProxy configuration file /etc/haproxy/haproxy.cfg to include the following lines:
```
frontend https-in
    bind *:443 ssl crt /etc/ssl/certs/example.com.crt
    default_backend servers

backend servers
    server server1 192.168.1.1:80
    server server2 192.168.1.2:80
```
Restart HAProxy: sudo systemctl restart haproxy
With these steps, HAProxy will now terminate SSL/TLS traffic at the load balancer and forward decrypted traffic to the backend servers.

## Bash Function
To simplify the process of generating SSL certificates, you can use the following Bash function:
```
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
This function takes a domain name as an argument and generates an SSL certificate and key in the /etc/ssl/private and /etc/ssl/certs directories, respectively.

To use the function, simply run generate_ssl_cert example.com (replacing example.com with your desired domain name).

## Tasks :

* **0. World wide web**
  * [0-world_wide_web](./0-world_wide_web): Bash script that displays
  information about subdomains on my configured servers.
  * Usage: `./0-world_wide_web <domain> <subdomain>`
  * Output: `The subdomain [SUB_DOMAIN] is a [RECORD_TYPE] record and
  points to [DESTINATION]`
  * If no `subdomain` parameter is passed, displays information about the
  subdomains `www`, `lb-01`, `web-01` and `web-02`, in that order.

* **1. HAproxy SSL termination**
  * [1-haproxy_ssl_termination](./1-haproxy_ssl_termination): HAproxy
  configuration file that accepts encrypted SSL traffic for the subdomain
  `www.` on TCP port 443.

* **2. No loophole in your website traffic**
  * [100-redirect_http_to_https](./100-redirect_http_to_https): HAproxy
  configuration file that automatically redirects HTTP traffic to HTTPS.

## AUTHOUR
[Martin Nyemba](martinnyemba@gmail.com)
