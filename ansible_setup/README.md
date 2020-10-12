# MLflow provision

Set up an Ubuntu server to run the [mlflow-production-docker](https://github.com/jameswilliams1/mlflow-production-docker) package.

## Quickstart

Ensure your public key is added to server, install Ansible, then run:

```sh
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts.yml playbook.yml
```
