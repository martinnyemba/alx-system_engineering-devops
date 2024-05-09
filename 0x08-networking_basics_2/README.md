# 0x08. Networking basics #1
This project covers networking basics, DevOps, network administration, and system administration topics.

## Resources
- Read or watch:
  - [What is localhost](https://en.wikipedia.org/wiki/Localhost)
  - [What is 0.0.0.0](https://en.wikipedia.org/wiki/0.0.0.0)
  - [What is the hosts file](https://en.wikipedia.org/wiki/Hosts_(file))
  - [Netcat examples](https://linux.die.net/man/1/nc)

## man or help
- [ifconfig](https://linux.die.net/man/8/ifconfig)
- [telnet](https://linux.die.net/man/1/telnet)
- [nc (netcat)](https://linux.die.net/man/1/nc)
- [cut](https://linux.die.net/man/1/cut)

## Learning Objectives
By the end of this project, you should be able to explain the following without needing Google:
- What is localhost/127.0.0.1
- What is 0.0.0.0
- What is /etc/hosts
- How to display your machine’s active network interfaces

## Requirements
### General
- Allowed editors: vi, vim, emacs
- All files interpreted on Ubuntu 20.04 LTS
- All files should end with a new line
- Bash script files must be executable and pass Shellcheck without errors
- First line of Bash scripts should be `#!/usr/bin/env bash`
- Second line should be a comment explaining the script's purpose

## Tasks
### 0. Change your home IP (mandatory)
Write a Bash script that configures an Ubuntu server with the following requirements:
- localhost resolves to 127.0.0.2
- facebook.com resolves to 8.8.8.8

### 1. Show attached IPs (mandatory)
Write a Bash script that displays all active IPv4 IPs on the machine it’s executed on.

### 2. Port listening on localhost (advanced)
Write a Bash script that listens on port 98 on localhost.

## Repo
- GitHub repository: [alx-system_engineering-devops](https://github.com/martinnyemba/alx-system_engineering-devops)
- Directory: 0x08-networking_basics_2

## Copyright
Copyright © 2024 ALX. All rights reserved.
