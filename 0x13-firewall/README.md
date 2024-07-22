# Project: 0x13. Firewall 
<br>

## `DevOps` | `SysAdmin` | `Security`
![Firewall Diagram](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/284/V1HjQ1Y.png)

### Resources

- **Read or watch:**
  - [What is a firewall](https://en.wikipedia.org/wiki/Firewall_%28computing%29)

### More Info
In this project, I learned how to use `telnet` as a tool to check if sockets are open with `telnet IP PORT`. For example, to check if port 22 is open on web-02, I used:

```sh
ubuntu@ubuntu$ telnet web-02.holberton.online 22
Trying 54.89.38.100...
Connected to web-02.holberton.online.
Escape character is '^]'.
SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2.8

Protocol mismatch.
Connection closed by foreign host.
ubuntu@ubuntu$
```

This shows that the connection is successful: `Connected to web-02.holberton.online`.

Next, I attempted to connect to port 2222:

```sh
ubuntu@ubuntu$ telnet web-02.holberton.online 2222
Trying 54.89.38.100...
^C
ubuntu@ubuntu$
```

This example shows that the connection never succeeds, so after some time I used `ctrl+c` to kill the process.

This method can be used not just for this exercise, but for any debugging situation where two pieces of software need to communicate over sockets.

It's important to note that the school network filters outgoing connections (via a network-based firewall), so interacting with certain ports on servers outside of the school network might not be possible. To test my work on web-01, I performed the tests from outside of the school network, like from my web-02 server. By SSHing into my web-02 server, the traffic originates from web-02 and not from the school’s network, bypassing the firewall.

### Warning!
Containers on demand cannot be used for this project (Docker container limitation).

In this project, I had to be very careful with firewall rules! For instance, if I ever `deny port 22/TCP` and log out of my server, I will not be able to reconnect to my server via SSH, and it would not be recoverable. When I installed `UFW`, port 22 was blocked by default, so I unblocked it immediately before logging out of my server.

### Tasks

#### 0. Block all incoming traffic but
**Mandatory**

In this task, I installed the `UFW firewall` and set up a few rules on web-01.

**Requirements:**
- The requirements below were applied to web-01 (though they can be applied to lb-01 and web-02, but it won’t be checked).
- I configured UFW to block all incoming traffic, except the following TCP ports:
  - `22 (SSH)`
  - `443` (HTTPS SSL)
  - `80` (HTTP)
- I shared the UFW commands used in the answer file.

**Repo:**
- **GitHub repository:** `alx-system_engineering-devops`
- **Directory:** `0x13-firewall`
- **File:** `0-block_all_incoming_traffic_but`

#### 1. Port forwarding
**#advanced**

In this task, I explored how firewalls can not only filter requests but also forward them.

**Requirements:**
- I configured web-01 so that its firewall redirects port 8080/TCP to port 80/TCP.
- The answer file contains a copy of the UFW configuration file that I modified to achieve this.

**Terminal in web-01:** My web server nginx was only listening on port 80. `netstat` showed that nothing was listening on 8080.

**Terminal in web-02:** I used `curl` to query `web-01.holberton.online`, and since my firewall was forwarding the ports, I received an HTTP 200 response on port 80/TCP and also on port 8080/TCP.

**Repo:**
- **GitHub repository:** `alx-system_engineering-devops`
- **Directory:** `0x13-firewall`
- **File:** `100-port_forwarding`
