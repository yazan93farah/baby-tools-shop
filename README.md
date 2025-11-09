# 🍼 Baby Tools Shop

## Table of Contents
1. [Project Description](#project-description)
2. [Quickstart](#quickstart)
   - [Run with Docker](#run-with-docker)
   - [Run Locally (without Docker)](#run-locally-without-docker)
3. [Usage](#usage)
   - [Configuration](#configuration)
   - [Environment Variables](#environment-variables)
   - [Accessing the App](#accessing-the-app)
---

## 🧩 Project Description

**Baby Tools Shop** is a Django-based web application that provides an online platform for managing and viewing baby products.  uses docker container. 

The repository includes:

- A Django project containing the **`baby_shop`** app  
- A **Dockerfile** for containerized deployment  
- A **`.env` file** for environment configuration  
- A **`.gitignore`** to exclude irrelevant files  
- Documentation compliant with the Baby Tools checklist  

The project can be run either locally (using Python virtual environment) or via Docker for consistent deployment.

---

## 🚀 Quickstart

### Run with Docker

#### Prerequisites
- [Docker](https://www.docker.com/) installed on your system  
- A `.env` file in the project root (see [Configuration](#configuration))

#### Steps
```bash
# 1. Build the Docker image
docker build -t baby-tools-shop .

# 2. Run the container (load environment variables from .env)
docker run -p 8025:8025 --env-file .env baby-tools-shop
```

Once started, the app will be available at:
```
http://<your-vm-ip>:8025/
```

---

### Run Locally (without Docker)

#### Prerequisites
- Python 3.10+  
- `pip` package manager  
- (Recommended) a virtual environment  

#### Steps
```bash
# 1. Clone the repository
cd baby-tools-shop

# 2. Create and activate a virtual environment
python -m venv venv
source venv/bin/activate  # on Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Create a .env file in the project root (see below)

# 5. Run migrations
python src/manage.py migrate

# 6. Start the development server
python src/manage.py runserver 0.0.0.0:8025
```

Your app will be available at:
```
http://localhost:8025/
```

---

## ⚙️ Usage

### Configuration
The project requires a `.env` file for environment-specific settings.  
This file must be **created manually** in the **project root directory** (the same folder as your `manage.py`, or one level above if your source code is inside a `src/` folder).

Environment variables are used to keep sensitive data (like secret keys, hostnames, and database URLs) **outside of version control**.  
This approach improves security and makes it easier to configure different environments (development, staging, production).

### Required Environment Variables
Create a new file named `.env` in the project root and add the following variables:

```bash

# Include your local machine and your server IP if deployed
DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1,your.vm.ip


```

To create an admin user:
```bash
python src/manage.py createsuperuser
``` 
or 
```bash
docker exec -it <container_name> bash
```

---


