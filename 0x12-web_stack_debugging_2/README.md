# 0x12. Web stack debugging #2
`DevOps`
`SysAdmin`
`Scripting`
`Debugging`

![Web stack debugging](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/287/99littlebugsinthecode-holberton.jpg)

### Concepts
For this project, I looked at the following concept:
- [Web stack debugging](https://intranet.alxswe.com/concepts/68)

### Requirements
**General:**
- All my files will be interpreted on Ubuntu 20.04 LTS
- All my files will end with a new line
- A `README.md` file at the root of the folder of the project is mandatory
- All my Bash script files will be executable
- My Bash scripts will pass Shellcheck without any error
- My Bash scripts will run without error
- The first line of all my Bash scripts will be exactly `#!/usr/bin/env bash`
- The second line of all my Bash scripts will be a comment explaining what the script does

## Tasks
-------------

#### 0. Run software as another user

![ Run software as another user](https://s3.amazonaws.com/alx-intranet.hbtn.io/uploads/medias/2020/9/eaeff07a715ff880b1ceb8e863a1d141a74a7f85.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIARDDGGGOUSBVO6H7D%2F20240722%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240722T220042Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=03ce444c2a71b6397da67f78a37332fe55184cb85daf2e1bb893e00f79b8f983)

**Mandatory**

In this project, I learned that the user `root` is, on Linux, the “superuser” and can do anything it wants. While this is powerful, it’s also risky because a single mistaken command can be disastrous. A good practice is to avoid logging in as the root user directly. Instead, I used a privileged user, which can perform tasks requiring root access, by using a specific command.

For the containers provided in this project and the checker, everything is run under the root user, which can run anything as another user.

**Requirements:**
- I wrote a Bash script that accepts one argument.
- The script runs the `whoami` command under the user passed as an argument.
- I tested my script by passing different users.

**Example:**

```sh
root@ubuntu:~# whoami
root
root@ubuntu:~# ./0-iamsomeoneelse www-data
www-data
root@ubuntu:~# whoami
root
root@ubuntu:~#
```

**Repo:**
- **GitHub repository:** `alx-system_engineering-devops`
- **Directory:** `0x12-web_stack_debugging_2`
- **File:** `0-iamsomeoneelse`

#### 1. Run Nginx as Nginx
**Mandatory**

In this project, I focused on running web servers with the least privileged user possible to enhance security. Instead of running the web server as the root user, which is the default in most configurations, I ran the process as the `nginx` user. This limits the impact of any potential security breaches, as the `nginx` user has fewer permissions than the root user.

**Requirements:**
- I ensured that Nginx is running as the `nginx` user.
- Nginx listens on all active IPs on port 8080.
- I did not use `apt-get remove`.
- I wrote a Bash script to configure the container according to the above requirements.

**After debugging:**

```sh
root@ab6f4542747e:~# ps auxff | grep ngin[x]
nginx      884  0.0  0.0  77360  2744 ?        Ss   19:16   0:00 nginx: master process /usr/sbin/nginx
nginx      885  0.0  0.0  77712  2772 ?        S    19:16   0:00  \_ nginx: worker process
nginx      886  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      887  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      888  0.0  0.0  77712  3208 ?        S    19:16   0:00  \_ nginx: worker process
root@ab6f4542747e:~#
root@ab6f4542747e:~# nc -z 0 8080 ; echo $?
0
root@ab6f4542747e:~#
```

**Repo:**
- **GitHub repository:** `alx-system_engineering-devops`
- **Directory:** `0x12-web_stack_debugging_2`
- **File:** `1-run_nginx_as_nginx`

#### 2. 7 lines or less
**#Advanced**

In this project, I optimized my solution from task #1 to make it more concise and efficient.

**Requirements:**
- My Bash script is 7 lines long or less.
- There is a new line at the end of the file.
- I respect Bash script requirements.
- I did not use `;`.
- I did not use `&&`.
- I did not use `wget`.
- I did not execute my previous answer file (Do not include the name of the previous script in this one).

**Repo:**
- **GitHub repository:** `alx-system_engineering-devops`
- **Directory:** `0x12-web_stack_debugging_2`
- **File:** `100-fix_in_7_lines_or_less`
