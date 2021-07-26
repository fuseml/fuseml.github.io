LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/fuseml/fuseml/releases/latest)
#curl -O "https://github.com/fuseml/fuseml/releases/latest/download/fuseml-installer-linux-amd64.tar.gz" # Get latest release from GitHub api

# The releases are returned in the format {"id":3622206,"tag_name":"hello-1.0.0.11",...}, we have to extract the tag_name.
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')

ARTIFACT_URL="https://github.com/fuseml/fuseml/releases/download/$LATEST_VERSION/fuseml-installer-linux-amd64.tar.gz"

echo $'\e[1;33m'Welcome to FuseML downloader...$'\e[0m'
sleep 2
echo $'\e[1;33m'starting download...$'\e[0m'
echo -e "\n"

curl -L $ARTIFACT_URL >> /tmp/fuseml-installer-linux-amd64.tar.gz
echo $'\e[1;33m'Moving things at their place...$'\e[0m'
sleep 2
tar -xvzf /tmp/fuseml-installer-linux-amd64.tar.gz >> out-null
chmod +x fuseml-installer
sudo mv fuseml-installer /usr/local/bin
sleep 2
echo $'\e[1;33m'Done.. you may start using Fuseml with:$'\e[1;32m' fuseml-installer -h$'\e[0m'
echo -e "\n"

