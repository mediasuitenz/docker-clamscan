#!/usr/bin/env sh

set -u

# Create directory paths if they don't already exist
mkdir -p ${CONTAINMENT_DIR}
mkdir -p ${SCAN_DIR}
mkdir -p ${DEFINITIONS_DIR}
# clamav user must be owner to write definitions cache
chown clamav:clamav ${DEFINITIONS_DIR}

echo -e "Updating virus definitions before scanning ${SCAN_DIR}\n"
echo -e "## UPDATE BEGINS ##"
freshclam --datadir=${DEFINITIONS_DIR}
echo -e "## UPDATE ENDS ##"

echo -e "\nRunning clamscan (Infected files will be moved to ${CONTAINMENT_DIR})\n"
echo -e "## SCAN BEGINS ##"
clamscan -r --move=${CONTAINMENT_DIR} --database=${DEFINITIONS_DIR} ${SCAN_DIR}
echo -e "## SCAN ENDS ##"
