# Project: Load balancer
In this project i improve on my web stack so that there is redundancy for our web servers.
This will allow me to be able to accept more traffic by doubling the number of web servers, and to make our infrastructure more reliable.
If one web server fails, we will still have a second one to handle requests.

For this project, i have written the Bash scripts to automate all the work.
All scripts are be designed to configure a brand new Ubuntu server to match the task requirements.

## Introduction to Load Balancing and HAProxy
Load balancing is a technique used in computing to distribute workloads across multiple servers. 
It is typically used to improve the performance and availability of web applications. 
Load balancing can help distribute traffic evenly across servers, reducing the likelihood of overloading any 
one server and causing downtime or slow response times.

HAProxy is an open-source software that provides load balancing and proxying for TCP and HTTP-based applications. 
It is known for its high performance, reliability, and advanced features. HAProxy can be used for various load 
balancing scenarios, including high availability, scalability, and fault tolerance.

__HTTP Header
HTTP header is a component of the HTTP protocol that contains metadata about the request or response message. 
It contains information such as the type of content being transferred, caching directives, authentication details, and more. 
The HTTP header is divided into two parts: the request header and the response header.

The request header contains information about the client making the request, such as the browser type 
and version, the user's IP address, and any cookies that have been set. The response header contains information 
about the server's response, such as the content type, the length of the response, and any caching directives.

Understanding HTTP headers is important for configuring load balancing and proxy servers, as they 
can be used to route traffic based on specific criteria.

__Debian/Ubuntu HAProxy Packages
Debian and Ubuntu are popular Linux distributions that provide HAProxy packages in their repositories. These packages are pre-built binaries that can be easily installed using the system's package manager.

## Requiremnts:
- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass Shellcheck (version 0.3.7) without any error
- The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
- The second line of all your Bash scripts should be a comment explaining what is the script doing

## Tasks :

* **0. Double the number of webservers**
  * [0-custom_http_response_header](./0-custom_http_response-header): Bash
  script that installs and configures Nginx on a server with a custom HTTP
  response header.
    * The name of the HTTP header is `X-Served-By`.
    * The value of the HTTP header is the hostname of the server.

* **1. Install your load balancer**
  * [1-install_load_balancer](./1-install_load_balancer): Bash script that
  installs and configures HAproxy version 1.5 on a server.
    * Enables management via the init script.
    * Requests are distributed using a round-robin algorithm.

## Conclusion:
Load balancing and HAProxy are important concepts in web application deployment, and understanding them 
can help improve the performance and availability of your applications. 
Additionally, using pre-built packages such as those provided by Debian and Ubuntu can 
simplify the installation and management of HAProxy.
