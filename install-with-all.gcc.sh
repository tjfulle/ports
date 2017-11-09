#!/bin/sh
set -x

port=/opt/local/bin/port
port=/opt/ports/clang/4.0/bin/port

# Set the compiler vendor, major, and minor versions.
# If clang, the compiler name needs to be modified
compiler_vendor=clang
compiler_major_version=4
compiler_minor_version=0

pc=$compiler_vendor$compiler_major_version$compiler_minor_version
compiler=$compiler_vendor-$compiler_major_version.$compiler_minor_version
cc=macports-$compiler_vendor-$compiler_major_version.$compiler_minor_version

# Compiler dependent ports are: superlu, boost, metis, hdf5, netcdf, SuiteSparse
$port -N install $compiler || exit
$port -N install superlu +$pc || exit
#$port -N install boost +$pc configure.compiler=$cc || exit
$port -N install yaml-cpp +$pc || exit
$port -N install metis +$pc || exit
$port -N install hdf5-18 +$pc || exit
$port -N install netcdf +$pc || exit
$port -N install hdf5 +$pc || exit
$port -N install SuiteSparse +$pc || exit

# OPENMPI Ports installed are: openmpi, boost, parmetis, scotch, hdf5, pnetcdf, netcdf
mpi=openmpi
$port -N install $mpi-$pc +threads || exit
$port -N install boost +$pc +$mpi configure.compiler=$cc configure.mpi=$mpi-$pc-fortran || exit
$port -N install yaml-cpp +$pc +$mpi || exit
$port -N install parmetis +$pc +$mpi || exit
$port -N install scotch +$pc +$mpi || exit
$port -N install hdf5-18 +$pc +gfortran +$mpi || exit
$port -N install pnetcdf +$pc +$mpi || exit
$port -N install netcdf +$pc +$mpi || exit
$port -N install hdf5 +$pc +gfortran +$mpi || exit

# Set the compiler vendor, major, and minor versions.
# If clang, the compiler name needs to be modified
compiler_vendor=gcc
compiler_major_version=6
compiler_minor_version=4
compiler=$compiler_vendor$compiler_major_version

port=/opt/ports/gcc/$compiler_major_version.$compiler_minor_version/bin/port

# Compiler dependent ports are: superlu, boost, metis, hdf5, netcdf, SuiteSparse
$port -N install $compiler || exit
$port -N install superlu +$compiler || exit
#$port -N install boost +$compiler configure.compiler=macports-$compiler_vendor-$compiler_major_version || exit
$port -N install yaml-cpp +$compiler || exit
$port -N install metis +$compiler || exit
$port -N install hdf5-18 +$compiler +fortran || exit
$port -N install netcdf +$compiler || exit
$port -N install hdf5 +$compiler +fortran || exit
$port -N install SuiteSparse +$compiler || exit

# OPENMPI Ports installed are: openmpi, boost, parmetis, scotch, hdf5, pnetcdf, netcdf
mpi=openmpi
$port -N install $mpi-$compiler +threads || exit
$port -N install boost +$compiler +$mpi configure.compiler=macports-$compiler_vendor-$compiler_major_version configure.mpi=$mpi-$compiler-fortran || exit
$port -N install yaml-cpp +$compiler +$mpi || exit
$port -N install parmetis +$compiler +$mpi || exit
$port -N install scotch +$compiler +$mpi || exit
$port -N install hdf5-18 +$compiler +fortran +$mpi || exit
$port -N install pnetcdf +$compiler +$mpi || exit
$port -N install netcdf +$compiler +$mpi || exit
$port -N install hdf5 +$compiler +fortran +$mpi || exit

$port -N install gsed || exit
$port -N install graphviz || exit
