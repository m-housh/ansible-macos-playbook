set shell := ["zsh", "-c"]
vaultpwd-file := "$HOME/.local/ansible/.vaultpwd"

default:
  just --list

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

install-requirements:
  ansible-galaxy install -r requirements.yml

ensure-homebrew-permissions:
  chmod -R g-w "/opt/homebrew/share"

install-nvim-plugins:
  zsh -l -c 'nvim --headless "+Lazy! sync" +qa' && \
    zsh -l -c 'nvim --headless "+MasonUpdate" +qa'

# Copy the default configuration and open in editor.
copy-config:
  cp ./default.config.yml config.yml && \
    [ -n "$EDITOR" ] && \
    $EDITOR config.yml
