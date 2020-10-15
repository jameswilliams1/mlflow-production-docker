# MLflow Provision and Deploy

Set up an Ubuntu server to run the [mlflow-production-docker](https://github.com/jameswilliams1/mlflow-production-docker) package.

## Setup

- Ensure your public key is present in your servers [authorized_keys file](https://www.ssh.com/ssh/authorized_keys/openssh/)
- Install Ansible locally: `pip3 install --user ansible`
- Add a host named `mlflow` to your [Ansible inventory file](https://docs.ansible.com/ansible/latest/network/getting_started/first_inventory.html#basic-inventory) pointing to your server's IP address/domain

## Provision

From the root directory run:

```sh
ansible-galaxy install -r deployment/requirements.yml
ansible-playbook deployment/provision.yml
```

## Deploy

TODO
