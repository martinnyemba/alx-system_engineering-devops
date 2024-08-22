# Postmortem

## Issue Summary

**Duration:** The outage occurred on August 21, 2024, from 08:00 to 18:20 Central African Time (CAT), lasting approximately 10 hours and 20 minutes.

**Impact:** The isolated Ubuntu 14.04 container running an Apache web server experienced a `500 Internal Server Error` on all GET requests. This error resulted in the inability to access a Holberton WordPress site hosted on the server. As a result, 100% of users attempting to access the website during the outage were affected.

**Root Cause:** The root cause of the issue was a typo in the WordPress `wp-settings.php` file, where the file `class-wp-locale.php` was incorrectly referenced as `class-wp-locale.phpp`. This typo led to a critical application error, causing the Apache web server to return `500 Internal Server Error`.

## Timeline

- **08:00 CAT:** The issue began; GET requests on the server started returning `500 Internal Server Error`.
- **18:00 CAT:** The issue was detected when an engineer attempted to access the project and observed the error.
- **18:05 CAT:** Initial investigation began by checking running processes using `ps aux`, confirming that two Apache processes (`root` and `www-data`) were running correctly.
- **18:10 CAT:** The Apache server's content directory was verified to be `/var/www/html/`, and the `strace` tool was used to trace the `root` Apache process, yielding no useful information.
- **18:20 CAT:** The `strace` tool was then run on the `www-data` process, revealing an `-1 ENOENT (No such file or directory)` error when attempting to access `class-wp-locale.phpp`.
- **18:30 CAT:** The typo was identified in the `wp-settings.php` file, and the trailing `p` was removed.
- **18:35 CAT:** The fix was tested, resulting in a successful `200 OK` response.
- **18:40 CAT:** A Puppet manifest was created to automate the correction of the typo in similar deployments.

## Root Cause and Resolution

**Root Cause:** The issue was caused by a typographical error in the `wp-settings.php` file within the WordPress installation. Specifically, the file `class-wp-locale.php` was mistakenly referenced as `class-wp-locale.phpp`. This typo caused WordPress to fail to locate the required file, leading to a fatal error and the subsequent `500 Internal Server Error` returned by the Apache server.

**Resolution:** The issue was resolved by locating the typo in the `wp-settings.php` file and correcting the file path by removing the extra `p`. Once the typo was corrected, the WordPress site loaded successfully, and the Apache server returned the expected `200 OK` status for GET requests. To prevent this issue in future deployments, a Puppet manifest was written to automate the correction of this specific error.

## Corrective and Preventative Measures

**Improvements:**
1. **Application Testing:** Ensure thorough testing of the application in a staging environment before deploying it to production. This could have identified the typo earlier.
2. **Monitoring:** Implement a robust monitoring system, such as UptimeRobot, to detect and alert on service outages promptly.
3. **Error Logging:** Enhance logging mechanisms to capture detailed error messages, aiding quicker diagnosis of issues.

**Tasks:**
- **Patch Deployment:** Review and patch all instances of the `wp-settings.php` file in other environments to correct any similar typos.
- **Add Monitoring:** Set up uptime monitoring and alerting for critical services to ensure immediate awareness of outages.
- **Enhance Logging:** Improve Apache and WordPress logging to capture more detailed error information during failures.

By addressing these areas, we can significantly reduce the likelihood of similar issues occurring in the future and ensure quicker resolution if they do arise.