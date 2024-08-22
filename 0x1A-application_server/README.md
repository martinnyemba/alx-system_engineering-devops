# Application Server Deployment

This project involves deploying our AirBnB clone by configuring a web server environment that efficiently serves both static and dynamic content. Specifically, I configured Nginx to serve a Flask web application via Gunicorn, and set up an Upstart script to ensure the application remains running even after server reboots. This project was conducted on servers provided by ALX.

## Tasks Overview 📄

### 1. Set Up Development Environment with Python
- **Task:** Configured the file `web_flask/0-hello_route.py` from my [AirBnB_clone_v2](https://github.com/martinnyemba/AirBnB_clone_v2) repository to serve content on the route `/airbnb-onepage/`, running on port `5000`.

### 2. Configure Production with Gunicorn
- **Task:** Set up a production environment by installing and configuring Gunicorn to serve the same Flask app as in Task 1.

### 3. Serve the Application via Nginx
- **Task:** Created an Nginx configuration file to proxy requests on the route `/airbnb-onepage/` to the Gunicorn application running on port `5000`. [Configuration file link](./2-app_server-nginx_config).

### 4. Add Route with Query Parameters
- **Task:** Extended the Nginx configuration to handle requests on the route `/airbnb-dynamic/number_odd_or_even/<int:num>`, forwarding them to the Gunicorn app on port `5000`. [Configuration file link](./3-app_server-nginx_config).

### 5. Serve the API
- **Task:** Configured the API from my [AirBnB_clone_v3](https://github.com/Tijani1402/AirBnB_clone_v31) repository to run on Gunicorn. Created an Nginx configuration file to proxy requests to the API. [Configuration file link](./4-app_server-nginx_config).

### 6. Serve the Complete AirBnB Clone
- **Task:** Configured the entire AirBnB application from [AirBnB_clone_v4](https://github.com/martinnyemba/AirBnB_clone_v4) to run on Gunicorn, and set up Nginx to serve both the dynamic content and static assets from `web_dynamic/static/`. [Configuration file link](./5-app_server-nginx_config).

### 7. Deployment
- **Task:** Created a configuration file for an Upstart script that launches a Gunicorn process bound to port `5003`. This script ensures that the Gunicorn process, which serves the full AirBnB application, starts automatically on server reboot. The process spawns three worker processes and logs errors and access information to `/tmp/airbnb-error.log` and `/tmp/airbnb-access.log` respectively. [Upstart script configuration file link](./gunicorn.conf).

### 8. Ensure Zero Downtime During Reloads
- **Task:** Developed a Bash script to gracefully reload Gunicorn without causing service interruptions. [Bash script link](./4-reload_gunicorn_no_downtime).

## Project Background

In this project, I expanded the web infrastructure from a basic Nginx server to include an application server (Gunicorn) for serving the dynamic content of our AirBnB clone. The goal was to integrate this application server with Nginx and ensure it runs reliably and efficiently, even after server restarts.

### General Requirements
- A `README.md` file at the root of the project directory.
- Python-related tasks must be done using `python3`.
- All configuration files must include comments for clarity.
  
### Bash Script Requirements
- Must be interpreted on Ubuntu 16.04 LTS.
- End with a new line and be executable.
- Pass Shellcheck (version 0.3.7-5~ubuntu16.04.1 via apt-get) without errors.
- Begin with `#!/usr/bin/env bash` and a comment explaining the script’s functionality.