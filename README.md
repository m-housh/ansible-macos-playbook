# Ansible Playbook: MacOS

This playbook is used to setup a new MacOS.

## Usage

1. Ensure Apple's command line tools are installed (`xcode-select --install`).
1. Clone this repository
   (`git clone https://github.com/m-housh/ansible-macos-playbook.git`)
1. Move into the cloned directory (`cd ansible-macos-playbook`)
1. Run the playbook using the helper script `source bootstrap`
1. Any arguments passed to the `bootstrap` command get passed to the
   `ansible-playbook` command, so you can skip certain tags if needed.

The default configuration is for my personal setups, if you'd like to override
it, then you can copy the `default.config.yml` prior to running the `bootstrap`
command.

### Copying the configuration for customizations.

`cp default.config.yml config.yml`

## License

This product is licensed under the MIT license.

See [License file](https://github.com/m-housh/ansible-macos-playbook/LICENSE)

## Acknowledgments

This playbook is inspired by the following playbooks.

- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook/tree/master).
- [jeromegamez/ansible-macos-playbook](https://github.com/jeromegamez/ansible-macos-playbook/)
