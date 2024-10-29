% wsl --install

# dependency
sudo apt update
sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libffi-dev libncurses5-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    liblzma-dev curl git

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
echo '. "$HOME/.asdf/asdf.sh"\n. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
source ~/.bachrc

asdf plugin add python

# pipx and poetry
sudo apt install pipx
pipx ensurepath
pipx install poetry
poetry config virtualenvs.in-project true

# cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-6

# gcm
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.0/gcm-win-x86-2.6.0.exe
open gcm-win-x86-2.6.0.exe
git config --global credential.helper "/mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager/git-credential-manager.exe"
# For Azure DevOps support only
git config --global credential.https://dev.azure.com.useHttpPath true

% SETX WSLENV %WSLENV%:GIT_EXEC_PATH/wp
% wsl --shutdown