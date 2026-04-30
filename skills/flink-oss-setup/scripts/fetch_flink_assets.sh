#!/bin/bash

# Usage: ./fetch_flink_assets.sh <flink_version> <output_dir>
# Example: ./fetch_flink_assets.sh 1.18 /tmp/my-flink-build

FLINK_VERSION=$1
OUTPUT_DIR=$2

if [ -z "$FLINK_VERSION" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <flink_version> <output_dir>"
    exit 1
fi

TMP_GIT_DIR=$(mktemp -d)
echo "Cloning flink-docker to $TMP_GIT_DIR..."
git clone --depth 1 https://github.com/apache/flink-docker "$TMP_GIT_DIR"

# Find the directory matching the version
# The repo structure is usually <version>/<variant>/Dockerfile
TARGET_DIR=$(find "$TMP_GIT_DIR" -type d -name "$FLINK_VERSION" | head -n 1)

if [ -z "$TARGET_DIR" ]; then
    echo "Error: Could not find directory for Flink version $FLINK_VERSION"
    rm -rf "$TMP_GIT_DIR"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"
cp -r "$TARGET_DIR"/* "$OUTPUT_DIR"
echo "Success: Assets for Flink $FLINK_VERSION copied to $OUTPUT_DIR"

rm -rf "$TMP_GIT_DIR"
