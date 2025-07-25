#!/bin/bash

# Determine CPU architecture
ARCH=$(uname -m)

# Map architecture to download URL
case $ARCH in
    "x86_64")
        URL="https://cdn.m2u.ir/uploads/68726fdd02a75_utunnel_manager_amd64"
        ;;
    "aarch64" | "arm64")
        URL="https://cdn.m2u.ir/uploads/68726fdd02a75_utunnel_manager_amd64"
        ;;
    "i386" | "i686")
        URL="https://cdn.m2u.ir/uploads/68726fdd02a75_utunnel_manager_amd64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Download the appropriate version
echo "Downloading utunnel_manager for $ARCH..."
wget -O utunnel_manager $URL || curl -o utunnel_manager $URL

if [ ! -f "utunnel_manager" ]; then
    echo "Failed to download utunnel_manager"
    exit 1
fi

# Make it executable
chmod +x utunnel_manager

# Run the manager
echo "Starting utunnel_manager..."
./utunnel_manager
