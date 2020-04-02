#!/usr/bin/env sh

set -u

echo "Updating virus definitions before scanning ${SCAN_DIR}..."
echo "(Infected files will be moved to ${CONTAINMENT_DIR})"

# Create virus containment directory if it doesn't already exist
mkdir -p ${CONTAINMENT_DIR}

freshclam
clamscan -r --move=${CONTAINMENT_DIR} ${SCAN_DIR}