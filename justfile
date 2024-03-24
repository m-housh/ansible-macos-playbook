set shell := ["zsh", "-c"]
vaultpwd-file := "$HOME/.local/ansible/.vaultpwd"

[private]
default:
  just --list

# Run's the playbook, any args are passed to ansible.
run-playbook *ARGS:
  #!/bin/sh
  if [ -r {{vaultpwd-file}} ]; then
    ansible-playbook \
      --vault-password-file {{vaultpwd-file}} \
      --ask-become-pass main.yml \
      {{ARGS}}
  else
    ansible-playbook \
      --ask-vault-password \
      --ask-become-pass main.yml \
      {{ARGS}}
  fi

# Install ansible-galaxy requirements needed to run this playbook.
install-requirements:
  ansible-galaxy install -r requirements.yml

# Fixes homebrew's share directory to prevent compinit warnings.
ensure-homebrew-permissions:
  chmod -R g-w "/opt/homebrew/share"

# Install neo-vim plugins in headless mode.
install-nvim-plugins:
  zsh -l -c 'nvim --headless "+Lazy! sync" +qa' && \
    zsh -l -c 'nvim --headless "+MasonUpdate" +qa'

# Copy the default configuration and open in editor.
copy-config:
  cp ./default.config.yml config.yml && \
    [ -n "$EDITOR" ] && \
    $EDITOR config.yml
