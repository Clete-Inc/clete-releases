#!/bin/sh
set -e

# Parse command line arguments
SPECIFIC_VERSION=""
while getopts "v:" opt; do
    case $opt in
        v) SPECIFIC_VERSION="$OPTARG" ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
    esac
done

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

# Get version based on input parameters
if [ -n "$SPECIFIC_VERSION" ]; then
    # Check if version exists
    if ! curl -s -f "https://api.github.com/repos/Clete-Inc/clete-releases/releases/tags/$SPECIFIC_VERSION" > /dev/null; then
        echo "Error: Version $SPECIFIC_VERSION not found"
        exit 1
    fi
    VERSION="$SPECIFIC_VERSION"
    echo "Installing specified version: $VERSION..."
else
    VERSION=$(curl -s https://api.github.com/repos/Clete-Inc/clete-releases/releases/latest | grep "tag_name" | cut -d '"' -f 4)
    echo "Installing latest stable version..."
fi

# Download URL
DOWNLOAD_URL="https://github.com/Clete-Inc/clete-releases/releases/download/${VERSION}/clete_${VERSION}_${OS}_${ARCH}.zip"

# Create temp directory
TMP_DIR=$(mktemp -d)
cd $TMP_DIR

# Download and install
echo "Downloading Clete ${VERSION} for ${OS}/${ARCH}..."
curl -sL "$DOWNLOAD_URL" -o clete.zip
unzip clete.zip

# Verify checksum - handle both Linux and macOS
if command -v sha256sum >/dev/null 2>&1; then
    sha256sum -c *.sha256
elif command -v shasum >/dev/null 2>&1; then
    shasum -a 256 -c *.sha256
else
    echo "Warning: Could not verify checksum - neither sha256sum nor shasum found"
fi

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
