# Ansible Playbook: MacOS

This playbook is used to setup a new MacOS.

## Usage

1. Ensure Apple's command line tools are installed (`xcode-select --install`).
1. Clone this repository
   (`git clone https://github.com/m-housh/ansible-macos-playbook.git`)
1. Move into the cloned directory (`cd ansible-macos-playbook`)
1. Run the playbook using the helper script `source bootstrap`, any arguments
   1. Any arguments passed to the `bootstrap` command get passed to the
      `ansible-playbook` command, so you can skip certain tags if needed.

The default configuration is for my personal setups, if you'd like to override
it, then you can copy the `default.config.yml` prior to running the `bootstrap`
command.

### Copying the configuration for customizations.

`cp default.config.yml config.yml`

Or if you have `just` installed on your machine, you can run the below command
which will copy the configuration and open in your editor, if you have the
`EDITOR` environment variable set.

`just copy-config`

### Tags

You can control which items get ran by using `--tags` or `--skip-tags`.

1. `dock-items` - Uses the `dockutil` program to persist, remove, or move items
   in the dock.
1. `dotfiles` - Ensures dotfiles / configuration files are linked to their
   proper locations and that the dotfiles repo is cloned.
   1. See the
      [ansible-role-dotfiles](https://github.com/m-housh/ansible-role-dotfiles)
      for tags related to the dotfiles role that is used with this playbook.
1. `homebrew` - Manage homebrew packages, casks, taps, and fonts.
   1. taps
   1. `casks`
   1. `packages`
   1. `fonts`
1. `launch-apps` - Launches applications, this is useful for certain apps that
   require some setup, or need to be launched. Some examples are `rectangle` and
   `spacelauncher` utilities.
1. `mas` - Downloads App Store apps using the `mas`-cli tool.
1. `osx-settings`
   1. `dock` - Settings for the dock (this is different than the dock-items,
      which controls applications in the dock)
   1. `finder` - Settings for finder.
   1. `desktop` - Settings for the desktop.
   1. `screenshots` - Settings for screenshots.
   1. `globals` - General settings for things such as keyboard, capitalization,
      scrolling, etc.

### Bootstrap script

The bootstrap script contains some extra steps that generally only need to be
ran when setting up a machine for the first time, such as installing neovim
plugins, ensuring homebrew is installed, ensuring ansible and it's requirements
are installed, etc.

Currently tumx plugins need to be installed manually after the bootstrap script
is ran, although the tmux plugin manager does get installed, so you just need to
start a tmux session then type `<C-a>L` to install the tmux plugins.

You can run the playbook without using the bootstrap script.

```bash
ansible-playbook main.yml --tags <the-tag-to-run> --ask-become-pass
```

Not all actions require the `--ask-become-pass` flag, however it's easier to
just include it.

### Justfile

If you have just installed (`brew install just`), then you can run the playbook
using `just run-playbook --tags <the-tag-to-run>`.

Review the `justfile` or run `just` to view the available commands.

## License

This product is licensed under the MIT license.

See [License file](https://github.com/m-housh/ansible-macos-playbook/LICENSE)

## Acknowledgments

This playbook is inspired by the following playbooks.

- [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook/tree/master).
- [jeromegamez/ansible-macos-playbook](https://github.com/jeromegamez/ansible-macos-playbook/)
