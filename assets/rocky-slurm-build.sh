#!/bin/bash
set -eu

die() {
    echo "Error: $@" 1>&2
    exit 2
}

if [ ! -d "/build-output" ]; then
    die "please mount the build output dir like so: \`docker run -v ./build:/build-output -i rocky-slurm-build\`"
fi

rpmbuild --with slurmrestd --with cgroup --define "_rpmdir /build-output" -ta ${SLURM_TARBALL} 2>&1 | tee /build-output/rpmbuild.log
