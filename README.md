# Ansible Playbook: MacOS

This playbook is used to setup a new MacOS.

## Usage

1. Ensure Apple's command line tools are installed (`xcode-select --install`).
1. Install [Homebrew](https://brew.sh)
1. Install Ansible (`brew install ansible`).
1. clone this repository.
1. Run `ansible-galaxy install -r requirements.yml` inside this directory to
   install required ansible roles.
1. Run `ansible-playbook main.yml --ask-become-pass` inside this directory.
   Enter your macOS account password when prompted for the 'BECOME' password.

## Acknowledgments

This playbook is inspired by the following playbooks.

- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook/tree/master).
- [jeromegamez/ansible-macos-playbook](https://github.com/jeromegamez/ansible-macos-playbook/)
