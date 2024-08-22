# Web Stack Debugging #3

This project involves debugging a WordPress website running on a LAMP (Linux, Apache, MySQL, PHP) stack. The primary goal is to identify the cause of a 500 Internal Server Error using `strace` and then automate the fix using Puppet.

## Project Context

When dealing with web stack issues, logs can sometimes be insufficient for diagnosing the problem. This project focuses on using `strace`, a powerful diagnostic tool, to trace system calls and signals to identify the root cause of the error. WordPress, a widely-used content management system, is often deployed on a LAMP stack, making it a relevant scenario for many real-world applications.

## Requirements

- **Operating System:** Ubuntu 14.04 LTS
- **Puppet Version:** v3.4
- **Puppet Lint Version:** 2.1.1
- **Project Directory:** `0x17-web_stack_debugging_3`
- **Mandatory Files:**
  - `0-strace_is_your_friend.pp`: Puppet manifest for automating the fix.

## Task Overview

### Task 0: Strace is Your Friend

**Objective:** Use `strace` to diagnose why Apache is returning a 500 Internal Server Error and then automate the fix using Puppet.
## Tasks :page_with_curl:

* **0. Strace is your friend**
  * [0-strace_is_your_friend.pp](./0-strace_is_your_friend.pp): Puppet manifest
  that fixes a typo error causing a WordPress application being served by an Apache
  web server to fail.
  * Usage: `puppet apply 0-strace_is_your_friend.pp`

#### Steps:
1. **Diagnose the Issue:**
   - Use `strace` to attach to the running Apache process and identify the root cause of the 500 error.
   - Utilize `tmux` or a similar terminal multiplexer to run `strace` in one window and test the server response with `curl` in another.

2. **Automate the Fix:**
   - Once the issue is identified, create a Puppet manifest (`0-strace_is_your_friend.pp`) to automate the fix.
   - Ensure the manifest uses the appropriate Puppet resource types and passes Puppet lint checks.

3. **Test the Fix:**
   - Apply the Puppet manifest to ensure the issue is resolved and Apache returns a 200 OK response.

#### Example Commands:
```bash
# Use curl to check the server's response
curl -sI 127.0.0.1

# Use strace to diagnose the issue
strace -p <apache_pid> -o /tmp/strace_output.txt

# Apply the Puppet manifest
puppet apply 0-strace_is_your_friend.pp
```

## Additional Information

- All files should end with a new line.
- All Puppet manifests must include a comment explaining their purpose.
- The first line of each Puppet manifest should be a comment describing the script's functionality.
- Files will be checked with `puppet-lint` and must pass without errors.

## Installation of Puppet Lint

To install `puppet-lint` on Ubuntu 14.04 LTS, use the following commands:

```bash
apt-get install -y ruby
gem install puppet-lint -v 2.1.1
```

## Conclusion

This project demonstrates the importance of deep diagnostic tools like `strace` in web stack debugging. By combining these tools with automation through Puppet, we can ensure a more robust and reliable server environment.

---

**Directory:** `0x17-web_stack_debugging_3`  
**File:** `0-strace_is_your_friend.pp`