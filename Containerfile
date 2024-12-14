# 1. BUILD ARGS

## These allow changing the produced image by passing different build args to adjust
## the source from which your image is built.
## Build args can be provided on the commandline when building locally with:
##   podman build -f Containerfile --build-arg FEDORA_VERSION=40 -t local-image

## SOURCE_IMAGE arg can be anything from ublue upstream which matches your desired version:
## See list here: https://github.com/orgs/ublue-os/packages?repo_name=main
##  "aurora", "bazzite", "bluefin" or "ucore" may also be used but have different suffixes.
ARG SOURCE_IMAGE="sericea"

## SOURCE_SUFFIX arg should include a hyphen and the appropriate suffix name
ARG SOURCE_SUFFIX="-main"

## SOURCE_TAG arg must be a version built for the specific image: eg, 39, 40, gts, latest
ARG SOURCE_TAG="latest"


# 2. SOURCE IMAGE

## this is a standard Containerfile FROM using the build ARGs above to select the right upstream image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

# 3. MODIFICATIONS

## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.
COPY shell-scripts/*.sh packages/*.txt /tmp

RUN mkdir -p /var/lib/alternatives && \
    wget https://proton.me/download/bridge/protonmail-bridge-3.15.0-1.x86_64.rpm -O /tmp/pm-bridge.rpm && \
    /tmp/build.sh && \
    ostree container commit

## NOTES:
# - /var/lib/alternatives is required to prevent failure with some RPM installs
# - All RUN commands must end with ostree container commit
#   see: https://coreos.github.io/rpm-ostree/container/#using-ostree-container-commit
