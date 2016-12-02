# Overview

A collection of Portfiles for MacPorts to build TPLs needed for
building [Trilinos](https://github.com/trilinos/Trilinos).

# Included Ports

The included ports come from the MacPorts project. In some cases, a port is just
a copy of the most recent port without modification. In others, the port is
modified to build the version/variant needed by Trilinos by default. Unmodified
Ports are included so that Portfiles for all of the necessary TPLs for Trilinos live
in one place.

* `devel/boost` 1.58.0: At the time of this writing, boost provided by MacPorts is at
  version 1.59.0. A bug in that version prevents using the variants +openmpi
  -no_single, as needed by Trilinos.

* `math/SuiteSparse` 4.2.1: Port not modified.
* `math/metis` 1.51.0: Port modified to build with `+longindex`, `+double`, and
  `+openmp` by default
* `math/parmetis` 4.0.3: Port not modified, but uses the modified metis port.
* `math/superlu` 4.3: MacPorts provides v5.2.1 but Trilinos is only guaranteed to
  work with v4.3
* `math/superlu_dist` 4.3: MacPorts provides a newer version, this version is
  consistent with superlu 4.3

* `science/hdf5` 1.10: Fixes for fortran and parallel variants
* `science/pnetcdf` 1.7.0: Build of parallel-netcdf, needed for `+openmpi` variant of `netcdf`
* `science/hdf5-18` 1.8.17: Fixes for fortran and parallel variants to be
  consistent with netcdf. Other options as required by seacas are turned on by
  default.
* `science/netcdf` 4.4.1: Modified to properly build parallel netcdf for `+openmpi` variant
* `science/scotch`: `+longindex` variant turned on by default to be consistent with metis

# Installation

## Clone the directory into the location of your choice:

```sh
git clone https://www.github.com/tjfulle/ports
```

## Add the directory to MacPorts `sources.conf` configuration file

*In the following, assume the `ports` directory was cloned to `/Users/user/Documents/ports` and MacPorts is installed in `opt/local`. Adjust paths as necessary for your system.*

Add the line

```sh
file:///Users/user/Documents/ports
```

*before* the default `rsync://rsync.macports.org/release/tarballs/ports.tar` in `/opt/local/etc/macports/sources.conf`.  See [Installing Local Ports](https://guide.macports.org/chunked/development.local-repositories.html).

Now add the ports to the port index:

```sh
cd /Users/user/Documents/ports
/opt/local/bin/portindex
```

You can now install the modified ports as usual.
