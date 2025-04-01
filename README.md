# Slurm-compiler

Podman/Docker containers to compile Slurm for Rocky, RHEL or Ubuntu

## Rocky-linux, RHEL

How-to :

- Make sure your host build directory is writable by the container user `chmod 777 ./build`
- Change the build target by changing the base image `FROM rockylinux/rockylinux:8.10` in [rocky-Dockerfile](./rocky-Dockerfile)
- if the docker image needs a root certificate to access the internet (for example `zscaler.pem`) add it to `./assets/root_certs/`
- Build the image, edit **24.05.7** to the desired Slurm version : `docker build -t rocky-slurm-build --build-arg version="24.05.7" -f rocky-Dockerfile .`
- compile Slurm : `docker run -v ./build:/build-output -i rocky-slurm-build`
- RPMs will be built into the `./build/${ARCH}/` folder, the rpmbuild log is into `./build/rpmbuild.log`

**Custom RPM :**\
You can add some rpm to be installed in the image by putting them in the [assets/rpms/](./assets/rpms/) folder.\
For example to build the plugin **switch/hpe_slingshot** you can add :

- cray-cassini-headers-user-*.rpm 
- cray-libcxi-devel-*.rpm
- cray-cxi-driver-devel-*.rpm
- cray-slingshot-base-link-devel-*.rpm
- cray-libcxi-*.rpm
- sl-driver-devel-*.rpm


## Ubuntu

How-to :

- Make sure your host build directory is writable by the container user `chmod 777 ./build`
- Change the build target by changing the base image `FROM ubuntu:24.04` in [ubuntu-Dockerfile](./ubuntu-Dockerfile)
- if the docker image needs a root certificate to access the internet (for example `zscaler.pem`) add it to `./assets/root_certs/`
- Build the image, edit **24.05.7** to the desired Slurm version : `docker build -t ubuntu-slurm-build --build-arg version="24.05.7" -f ubuntu-Dockerfile .`
- compile Slurm : `docker run -v ./build:/build-output -i ubuntu-slurm-build`
- DEBs will be built into the `./build/` folder, the rpmbuild log is into `./build/debuild.log`

