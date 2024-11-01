# Clete Releases

This repository contains official binary releases for Clete. Each release includes pre-compiled binaries for multiple platforms and their corresponding SHA256 checksums for verification.

## Quick Install

### Linux/macOS

```bash
curl -sfL https://raw.githubusercontent.com/Clete-Inc/clete-releases/main/install.sh | sh
```

### Windows
Download the appropriate zip file from the [Releases](https://github.com/Clete-Inc/clete-releases/releases) page:
- Windows 64-bit: `clete_v*_windows_amd64.exe.zip`
- Windows 32-bit: `clete_v*_windows_386.exe.zip`

Extract the zip file and move the executable to a location in your PATH.

## Supported Platforms

- Windows (64-bit, 32-bit)
- Linux (64-bit, 32-bit, ARM64, ARM)
- macOS (Intel, Apple Silicon)

## Manual Installation

If you prefer to download and install manually, visit our [Releases](https://github.com/Clete-Inc/clete-releases/releases) page and download the appropriate version for your system.

## Verify Installation

After installation, verify that Clete is working correctly:

```bash
clete --version
```

## Updating

To update to the latest version, simply run the install script again.

## Support

For issues, questions, or contributions:
- [Open an Issue](https://github.com/Clete-Inc/clete-releases/issues)
