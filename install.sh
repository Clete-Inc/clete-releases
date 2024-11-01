#!/bin/sh
set -e

# Detect OS and architecture
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Convert architecture names
case $ARCH in
    x86_64) ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    armv7l) ARCH="arm" ;;
    i386) ARCH="386" ;;
esac

# Get latest version
VERSION=$(curl -s https://api.github.com/repos/Clete-Inc/clete-releases/releases/latest | grep "tag_name" | cut -d '"' -f 4)

# Download URL
DOWNLOAD_URL="https://github.com/Clete-Inc/clete-releases/releases/download/${VERSION}/clete_${VERSION}_${OS}_${ARCH}.zip"

# Create temp directory
TMP_DIR=$(mktemp -d)
cd $TMP_DIR

# Download and install
echo "Downloading Clete ${VERSION} for ${OS}/${ARCH}..."
curl -sL "$DOWNLOAD_URL" -o clete.zip
unzip clete.zip

# Verify checksum
sha256sum -c *.sha256

# Notify user about upcoming sudo operations
echo "The following operations require administrator privileges:"
echo "- Moving clete binary to /usr/local/bin/"
echo "- Setting executable permissions"
echo "You may be prompted for your password."

# Install binary
sudo mv clete_${VERSION}_${OS}_${ARCH} /usr/local/bin/clete
sudo chmod +x /usr/local/bin/clete

# Cleanup
cd - > /dev/null
rm -rf $TMP_DIR

echo "Clete ${VERSION} installed successfully!"
clete --version
