#!/bin/bash
set -eu

die() {
    echo "Error: $@" 1>&2
    exit 2
}

if [ ! -d "/build-output" ]; then
    die "please mount the build output dir like so: \`docker run -v ./build:/build-output -i rocky-slurm-build\`"
fi

cd "slurm-${SLURM_VERSION}"
debuild -b -uc -us 2>&1 | tee /build-output/debuild.log
cp /root/slurm-*.deb /build-output/
cp /root/slurm-*.ddeb /build-output/
