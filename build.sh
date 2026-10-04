#! /bin/bash

# Create the expected output directory
mkdir -p output

# Build the image locally
podman build -t localhost/charoite -f src/Containerfile .

# Produce a container image (requires elevation)
sudo podman run --rm --privileged \
   --security-opt label=type:unconfined_t \
   -v ./output:/output \
   -v $HOME/.local/share/containers/storage:/var/lib/containers/storage \
   quay.io/centos-bootc/bootc-image-builder:latest \
   --type qcow2 --rootfs xfs \
   localhost/charoite:latest
