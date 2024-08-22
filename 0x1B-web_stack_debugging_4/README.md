# Web Stack Debugging: Project #4

This is the fifth installment in a series of web stack debugging projects. In each project, I have provided with broken or malfunctioning web stacks, contained within isolated environments. My task is to diagnose the issues and restore the web stack to a fully functional state. To streamline the process, I developed scripts that automate the necessary commands for fixing each web stack.

## Tasks:

* **0. Sky is the Limit – Let's Push It Higher**
  * [0-the_sky_is_the_limit_not.pp](./0-the_sky_is_the_limit_not.pp): This Puppet manifest is designed to optimize an Apache web server, enabling it to handle a higher volume of traffic efficiently.

* **1. User Limit**
  * [1-user_limit.pp](./1-user_limit.pp): This Puppet manifest modifies the operating system's configuration to allow successful login with the user `holberton` and enables file operations without errors.

## Project Requirements

- All files are designed for Ubuntu 14.04 LTS.
- Each file ends with a newline.
- A `README.md` file is included at the root of the project directory.
- Puppet manifests must pass `puppet-lint` version 2.1.1 with no errors.
- Puppet manifests must execute without errors.
- The first line of each Puppet manifest is a comment explaining its purpose.
- All Puppet manifest files have the `.pp` extension.
- Files are checked using Puppet v3.4.

## Installation of `puppet-lint`:
```bash
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```