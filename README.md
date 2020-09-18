# Traefik Basic Auth

Traefik in Docker with HTTP basic auth configured.

## Setup

Install requirements:

- Apache Utils (provides `htpasswd` command)
- GNU gettext (provides `envsubst` command)

```sh
sudo apt-get install -y apache2-utils gettext
```

Create a new `.htpasswd` file with a single user (using Bcrypt hashing):

```sh
htpasswd -cB config/.htpasswd <username>
```

Add additional users with:

```sh
htpasswd -B config/.htpasswd <other_username>
```

Create a `.env` in the root directory with the following variables completed:

```sh
# connection settings
DOMAIN_NAME=localhost
SERVICE_NAME=mlflow
SERVICE_PORT=5000
# tell the user where they are logging into
REALM=testsite
# required for letsencrypt HTTPS email updates
EMAIL_ADDRESS=example@example.com

```

Then write a `traefik.yml` config file using the `.env` variables:

```sh
./write_template.sh
```

## Running

Start Traefik:

```sh
docker-compose up -d --build
```

The site is accessible on port 443, and port 80 redirects to 443.
