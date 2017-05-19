#!/bin/sh
set -x

port=/opt/local/bin/port

# Set the compiler vendor, major, and minor versions.
# If clang, the compiler name needs to be modified
compiler_vendor=gcc
compiler_major_version=6
compiler_minor_version=3
if [ $compiler_vendor == clang ]; then
    compiler=$compiler_vendor$compiler_major_version$compiler_minor_version
else
    compiler=$compiler_vendor$compiler_major_version
fi

# Compiler dependent ports are: superlu, boost, metis, hdf5, netcdf, SuiteSparse
$port install $compiler || exit
$port install superlu +$compiler || exit
$port install boost +$compiler configure.compiler=macports-$compiler_vendor-$compiler_major_version || exit
$port install yaml-cpp +$compiler || exit
$port install metis +$compiler || exit
$port install hdf5-18 +$compiler +fortran || exit
$port install netcdf +$compiler || exit
$port install hdf5 +$compiler +fortran || exit
$port install SuiteSparse +$compiler || exit

# OPENMPI Ports installed are: openmpi, boost, parmetis, scotch, hdf5, pnetcdf, netcdf
mpi=openmpi
$port install $mpi-$compiler +threads || exit
$port install boost +$compiler +$mpi configure.compiler=macports-$compiler_vendor-$compiler_major_version configure.mpi=$mpi-$compiler-fortran || exit
$port install yaml-cpp +$compiler +$mpi || exit
$port install parmetis +$compiler +$mpi || exit
$port install scotch +$compiler +$mpi || exit
$port install hdf5-18 +$compiler +fortran +$mpi || exit
$port install pnetcdf +$compiler +$mpi || exit
$port install netcdf +$compiler +$mpi || exit
$port install hdf5 +$compiler +fortran +$mpi || exit
