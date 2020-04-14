# docker-clamscan

## Intention
This project intends to provide a configurable clamav image so that it can be used to scan a folder for viruses.
The virus definitions get updated every time this image is run.

## Configuration
Configuration is done via environment variables, so that users of the image can set things up how they desire.

Options are:

* `SCAN_DIR`: path to the folder(s) that should be scanned. This folder should be mounted into the container at runtime (using -v option for docker run).
* `CONTAINMENT_DIR`: path to the folder that infected files will be moved to.
* `DEFINITIONS_DIR`: path to the folder that the current virus definitions will be stored. This will get created on the mounted volume if it does not already exist.

## Example Usage
```
docker build -t clamscan .
docker run -e SCAN_DIR="/files/resources /files/uploads" -e CONTAINMENT_DIR="/clamav/quarantine" -e DEFINITIONS_DIR="/clamav/definitions -v $PWD/files:/files -v $PWD/clamav:clamav clamscan
```
This example mounts an external volume in at `/files` on the container, and tells `clamscan` to scan two subfolders (`/files/resources` and `/files/uploads`). Another folder, `clamav` is mounted and any files that fail scanning are placed in `/clamav/quarantine`. Any definitions updates will store info into `/clamav/definitions`, making the update process quicker if there are no new definitions.

## Logging
The container will log the scan output when running, so you may leverage this to set up notifications or whatever you need when infections are found.