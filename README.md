# traefik-basic-auth

Traefik in Docker with HTTP basic auth configured.
MLflow Production Docker

A production ready<sup>1</sup> docker-compose deployment of MLflow using Traefik with HTTP Basic Auth.

<sup>1</sup> This project is provided as is, and without a warranty of any kind, see [LICENSE](../blob/master/LICENSE) for full details.

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
# required for letsencrypt certificate email updates
EMAIL_ADDRESS=example@example.com
# Database settings
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=
POSTGRES_PORT=
POSTGRES_DB=
# Mlflow settings
MLFLOW_ARTIFACT_URI=s3://bucket-name/
# If using bentoml for deployment
```

Finally write a `traefik.yml` config file using the `.env` variables:

```sh
./write_template.sh
```

## Running

Start all containers:

```sh
docker-compose up -d --build
```

MLflow is accessible on port 443 over HTTPS (port 80 redirects to 443). Use the username and password you created above to log in.
