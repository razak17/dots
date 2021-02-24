# grep razak /etc/passwd
# chsh --shell /bin/zsh razak
# grep razak /etc/passwd
# echo $HELL
# npm install -g typescript-language-server

# Requirements
# zsh
# git

# ssh
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Change default shell
cat /etc/shells
chsh --shell /bin/zsh razak

# Oh-my-zsh setup
echo Install oh-my-zsh now...
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo $'\n'
echo Install oh-my-zsh plugins...
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# Oh-my-zsh setup end

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux     /plugins/tpm

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0-rc1

# fnm
curl -fsSL https://fnm.vercel.app/install | bash
