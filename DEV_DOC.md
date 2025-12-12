# 1. Environment Setup From Scratch
Prerequisites

Install the following on the host machine:

Docker

Docker Compose

A .env file located at:

$(HOME)/env/.env

Required .env variables

MariaDB

DB_NAME

DB_USER

DB_PASSWORD

DB_ROOT_PASSWORD

WordPress

WP_ADMIN_USER

WP_ADMIN_PASSWORD

WP_ADMIN_EMAIL

Domain

DOMAIN_NAME=pauldos-.42.fr

# 2. Building and Launching the Project
Clone the repository:
```
git clone <repo-url> rootInception
cd rootInception
```
Build and start everything:
```
make
```

Or explicitly:
```
make all
make up
```

This will:

Build all service images from the included Dockerfiles

Create persistent data folders

Start the full Docker Compose stack

# 3. Useful Commands for Developers
View running containers:
```
docker compose ps
```
View logs:
```
docker logs nginx
docker logs wordpress
docker logs mariadb
```
Rebuild everything:
```
make re
```
Stop containers:
```
make down
```
Stop and clean orphan containers:
```
make clean
```
Full cleanup (containers, images, volumes, .env):
```
make fclean
```
Enter service shells:
```
docker exec -it wordpress bash
docker exec -it mariadb bash
```
# 4. Data Persistence and Storage Layout

The project uses Docker volumes mapped to user directories:
```
$(HOME)/data/mariadb/
$(HOME)/data/wordpress/
```

mariadb/ stores all database tables

wordpress/ stores uploads, plugins, themes, and persistent WordPress content

Volumes are not removed unless running:
```
make fclean
```
# 5. Project Structure Overview
```
├── DEV_DOC.md
├── Makefile
├── README.md
├── srcs
│   ├── docker-compose.yml
│   └── requirements
│       ├── mariadb
│       │   ├── conf
│       │   │   └── 50-server.cnf
│       │   ├── Dockerfile
│       │   └── mariadb-run.sh
│       ├── nginx
│       │   ├── conf
│       │   │   └── nginx.conf
│       │   └── Dockerfile
│       └── wordpress
│           ├── conf
│           │   └── www.conf
│           ├── Dockerfile
│           └── install_wordpress.sh
└── USER_DOC.md
```
Each service is built from scratch, using its own Dockerfile, config files, and entrypoint scripts.

# 6. Development Notes and Design Decisions

No prebuilt images (mandatory requirement)

A private Docker network isolates services internally

NGINX enforces HTTPS using self-signed certificates

WordPress is executed through PHP-FPM for performance

MariaDB is initialized using custom scripts

The Makefile automates the full workflow: setup, rebuild, cleanup

END OF DEV_DOC.md
