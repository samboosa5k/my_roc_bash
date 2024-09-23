# my_roc_bash

My attempt to combine Roc (branched from Elm) and bash, to create simple Linux apps

## Installation

Guide: https://www.roc-lang.org/install/linux_x86_64

### Initial setup

```bash

# Wget the tarball
jasper@fedora : ~/_WEB 
>
wget https://github.com/roc-lang/roc/releases/download/nightly/roc_nightly-linux_x86_64-latest.tar.gz

# Extract the tarball
jasper@fedora : ~/_WEB 
>
tar -xf roc_nightly-linux_x86_64-latest.tar.gz
cd roc_nightly-linux_x86_64-2024-09-23-5f3a956

# cd into the extracted folder
# Add the roc binary to your PATH
jasper@fedora : ~/_WEB/roc_nightly-linux_x86_64-2024-09-23-5f3a956
>
echo 'export PATH="$PATH:~/_WEB/roc_nightly-linux_x86_64-2024-09-23-5f3a956"' >> ~/.bashrc

```

### Dependencies

```bash

# Source the bashrc
jasper@fedora : ~/_WEB/roc_nightly-linux_x86_64-2024-09-23-5f3a956
>
source ~/.bashrc

# Install the dependencies
jasper@fedora : ~/_WEB/roc_nightly-linux_x86_64-2024-09-23-5f3a956
>
sudo dnf install glibc-devel binutils &&
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
sudo dnf check-update && sudo dnf install clang &&
source ~/.bashrc


# Download the basic-cli project
```bash

jasper@fedora : ~/_WEB/
>
git clone https://github.com/roc-lang/basic-cli.git &&
cd basic-cli

jasper@fedora : ~/_WEB/basic-cli
>
roc build.roc &&
./ci/get_latest_release_git_files.sh

# Compile an example
jasper@fedora : ~/_WEB/basic-cli
>
roc --prebuilt-platform examples/hello-world.roc 
# output: roc: /lib64/libtinfo.so.6: no version information available (required by roc)
# output: Hello, World!

# Run the compiled binary
jasper@fedora : ~/_WEB/basic-cli
./examples/hello-world 
# output Hello, World!

```

