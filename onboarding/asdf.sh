# Install Node through ASDF.
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 14.5.0
asdf install nodejs 15.5.1
asdf global nodejs 14.5.0
# asd end