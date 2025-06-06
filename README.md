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

## Why x?

### 1password

The reason 1password is installed as an overlay app instead of a flatpak has to do with the fact that the flatpak version does not support ssh agent integration nor can it communicate with the CLI tool.

### Visual Studio Code

The reason vscode is installed as an overlay app instead of a flatpak has to do with the fact that the shell integration would
run in an isolated environment and it would require jumping through hoops to get it to run on the host. And those workaround may stop working in the future.

### Terminal

I have it set up the way I want as a personal preference. I prefer bat over cat, eza over ls and oh my zsh with its various plugins over other shells. I also do development stuff so that's why there are various linters etc installed.

### Mangohud configs

I have some game specific configs that mostly limit fps as not to heat up my PC unnecessarily and as a side effect make a lot of noise.
