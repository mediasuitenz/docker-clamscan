# docker-clamav

## Intention
This project intends to provide a configurable clamav image so that it can be used to scan a folder for viruses.
The virus definitions get updated every time this image is run.

## Configuration
Configuration is done via environment variables, so that users of the image can set things up how they desire.

Options are:

* `SCAN_DIR`: path to the folder that should be scanned. This folder will get mounted into the container at runtime.
* `CONTAINMENT_DIR`: path to the folder that infected files will be moved to.

## Example Usage
```
docker build -t clamscan .
docker run -e SCAN_DIR="/files" -e CONTAINMENT_DIR="/virus" -v $PWD/files:/files clamscan
```
This example mounts an external volume in at `/files` on the container, and tells `clamscan` to scan that folder. The containment directory is inside the container in this example (scan.sh will create the containment dir if it doesn't already exist). This path could be to another mounted volume instead if you wanted to keep the virus files on the host for easier access.

## Logging
The container will log the scan output when running, so you may leverage this to set up notifications or whatever you need when infections are found.