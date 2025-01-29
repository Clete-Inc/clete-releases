# Clete Releases

This repository contains official binary releases for Clete. Each release includes pre-compiled binaries for multiple platforms and their corresponding SHA256 checksums for verification.

## Quick Install

### Linux/macOS

Install the latest stable release:
```bash
curl -sfL https://raw.githubusercontent.com/Clete-Inc/clete-releases/main/install.sh | sh
```

Install a specific version:
```bash
curl -sfL https://raw.githubusercontent.com/Clete-Inc/clete-releases/main/install.sh | sh -s -- -v v1.0.0
```

### Windows

1. Download the appropriate zip file from the [Releases](https://github.com/Clete-Inc/clete-releases/releases) page:
   - For 64-bit Windows (most common): `clete_v*_windows_amd64.exe.zip`
   - For 32-bit Windows: `clete_v*_windows_386.exe.zip`

2. Right-click the downloaded zip file and select "Extract All..."

3. Choose a destination folder for extraction (e.g., `C:\Program Files\Clete`)

4. Add to PATH (choose one method):
   
   **Method A: Using GUI**
   - Right-click on 'This PC' or 'My Computer'
   - Click 'Properties'
   - Click 'Advanced system settings'
   - Click 'Environment Variables'
   - Under 'System Variables', find and select 'Path'
   - Click 'Edit'
   - Click 'New'
   - Add the folder path where you extracted Clete (e.g., `C:\Program Files\Clete`)
   - Click 'OK' on all windows

   **Method B: Using Command Prompt (Admin)**
   ```cmd
   setx PATH "%PATH%;C:\Program Files\Clete" /M
   ```

5. Open a new Command Prompt and verify the installation:
   ```cmd
   clete --version
   ```

## Supported Platforms

- Windows (64-bit, 32-bit)
- Linux (64-bit, 32-bit, ARM64, ARM)
- macOS (Intel, Apple Silicon)

## Installation Options

The install script (`install.sh`) supports the following options:

- Install latest stable release (default):
  ```bash
  ./install.sh
  ```

- Install specific version:
  ```bash
  ./install.sh -v v1.0.0
  ```

## Manual Installation

If you prefer to download and install manually:

1. Visit our [Releases](https://github.com/Clete-Inc/clete-releases/releases) page
2. Download the appropriate version for your system
3. Verify the SHA256 checksum
4. Extract the zip file
5. Move the binary to your PATH (e.g., `/usr/local/bin` on Unix-like systems)

## Verify Installation

After installation, verify that Clete is working correctly:

```bash
clete --version
```

## Updating

To update to the latest stable version:
```bash
curl -sfL https://raw.githubusercontent.com/Clete-Inc/clete-releases/main/install.sh | sh
```

To update to a specific version:
```bash
curl -sfL https://raw.githubusercontent.com/Clete-Inc/clete-releases/main/install.sh | sh -s -- -v v1.0.0  # Replace with desired version
```

## Support

For issues, questions, or contributions:
- [Open an Issue](https://github.com/Clete-Inc/clete-releases/issues)
