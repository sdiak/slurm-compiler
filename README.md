# Slurm-compiler

Podman/Docker containers to compile Slurm for Rocky, RHEL, Debian or Ubuntu

## Rocky-linux, RHEL

How-to :

- Make sure your host build directory is writable by the container user `chmod 777 ./build`
- Change the build target by changing the base image `FROM rockylinux/rockylinux:8.10` in [Dockerfile](./rocky-Dockerfile)
- Change the Slurm version (`SLURM_VERSION`, `SLURM_TARBALL` et `SLURM_TARBALL_LOC`) in [Dockerfile](./Dockerfile)
- if the docker image needs a root certificate to access the internet (for example `zscaler.pem`) add it to `./assets/root_certs/`
- Build the image, edit **24.05.7** to the desired Slurm version : `docker build -t rocky-slurm-build --build-arg version="24.05.7" -f rocky-Dockerfile .`
- compile Slurm : `docker run -v ./build:/build-output -i rocky-slurm-build`
- RPMs will be built into the `./build/${ARCH}/` folder, the rpmbuild log is into `./build/rpmbuild.log`

