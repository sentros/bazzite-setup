# Bazzite setup

This repo tries to bootstrap bazzite to a usable state after a clean installation. Good for setting up Bazzite if for some reason the OS needs to be reinstalled due to say switching DE or GPU vendor.

## Prerequisites

- ansible
- git

Probably the "best" way to install ansible is to use pip:

```bash
pip install --user ansible
```

## Running setup playbook

```bash
git clone https://github.com/sentros/bazzite-setup
cd bazzite-setup
ansible-playbook main.yaml --ask-become-pass -vv
```

## Running parts of playbook

```bash
ansible-playbook main.yaml --ask-become-pass -vv --tags terminal
```
