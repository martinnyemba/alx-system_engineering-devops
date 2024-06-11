# Project - 0x09. Web infrastructure design

Project is about how to design a Web Infrastructure.
Web infrastructure design refers to the process of designing the underlying hardware and software components that support a website or web application.
This includes the physical infrastructure such as servers, storage devices, and network components, as well as the software components such as web servers, databases, and operating systems.

The design of web infrastructure involves making decisions about the architecture of the system, such as whether to use a centralized or distributed architecture, 
as well as selecting the appropriate hardware and software components to meet the performance, scalability, and reliability requirements of the website or web application.

## Key concepts
* Network basics
* Server
* Web server
* Application server
* DNS & DNS record types
* Load Balancer
* Monitoring
* Database
* Single point of failure
* HTTP & HTTPS
* Firewall

## File Descriptions

Each file contains a link to an image hosted on [Imgur](https://imgur.com/).
### [0-simple_web_stack](0-simple_web_stack)

On a whiteboard, design a one server web infrastructure that hosts the website that is reachable via `www.foobar.com.` Start your explanation by having a user wanting to access your website. <br />

You must use:

* 1 physical server

* 1 web server (Nginx)

* 1 application server

* 1 application files (your code base)

* 1 database (MySQL)

* 1 domain name `foobar.com` configured with a `www` record that points to your server IP `8.8.8.8`

### [1-distributed_web_infrastructure](1-distributed_web_infrastructure)

On a whiteboard, design a three servers web infrastructure that host the website `www.foobar.com`. <br />

You must add to [0-simple_web_stack](0-simple_web_stack):

* 2 physical servers

* 1 web server (Nginx)

* 1 application server

* 1 load-balancer (HAproxy)

* 1 application files (your code base)

* 1 database (MySQL)

### [2-secured_and_monitored_web_infrastructure](2-secured_and_monitored_web_infrastructure)

On a whiteboard, design a three servers web infrastructure that host the website `www.foobar.com`, it must be secured, serve encrypted traffic and be monitored. <br />

You must add to [1-distributed_web_infrastructure](1-distributed_web_infrastructure):

* 3 firewalls

* 1 SSL certificate to serve `www.foobar.com` over HTTPS

* 3 monitoring clients (data collector for Sumologic or other monitoring services)

### [3-scale_up](3-scale_up)

You must add to [2-secured_and_monitored_web_infrastructure](2-secured_and_monitored_web_infrastructure):

* 1 physical server

* 1 load-balancer (HAproxy) configured as cluster with the other one

* Split components (web server, application server, database) with their own server
