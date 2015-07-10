#!/bin/sh

red=31
green=32
yellow=33
blue=34

function cecho {
    color=$1
    shift
    echo "\033[${color}m$@\033[m"
}

cecho $yellow "Starting getting snipets from GitHub!"
cecho $blue "Get yasnippet-snippets..."
git clone https://github.com/AndreaCrotti/yasnippet-snippets
cecho $blue "Setting for web-mode! (mkdir web-mode, cat web-mode/.yas-parent)"
mkdir yasnippet-snippets/web-mode
cat <<EOF > yasnippet-snippets/web-mode/.yas-parents
html-mode
css-mode
EOF
cecho $blue "Get matlab-snippets..."
git clone https://github.com/rysk-t/matlab-snippets.git
cecho $blue "Get java-snippets..."
git clone https://github.com/nekop/yasnippet-java-mode.git
cp -r yasnippet-java-mode/snippets/java-mode/* yasnippet-snippets/java-mode/
rm -Rf yasnippet-java-mode
cecho $yellow "Done!"
