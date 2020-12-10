# Try to find BLAS, including cblas.h
#
# Defines the following variables:
#   CBLAS_FOUND          Boolean holding whether or not the Netlib BLAS library was found
#   CBLAS_INCLUDE_DIRS   The Netlib BLAS include directory
#   CBLAS_LIBRARIES      The Netlib BLAS library
#
# In case BLAS is not installed in the default directory, set the CBLAS_ROOT variable to point to
# the root of BLAS, such that 'cblas.h' can be found in $CBLAS_ROOT/include. This can either be
# done using an environmental variable (e.g. export CBLAS_ROOT=/path/to/BLAS) or using a CMake
# variable (e.g. cmake -DCBLAS_ROOT=/path/to/BLAS ..).

# Copyright (c) 2016, Cedric Nugteren <www.cedricnugteren.nl>
# Copyright (c) 2020, Mahrud Sayrafi, <mahrud@umn.edu>
# Redistribution and use is allowed according to the terms of the Apache Version 2.0 license.

# Finds the include directories
find_path(CBLAS_INCLUDE_DIRS NAMES cblas.h
  HINTS CBLAS_ROOT ENV CBLAS_ROOT
  PATHS ${INCLUDE_INSTALL_DIR} ${CMAKE_INSTALL_PREFIX}/include
  PATH_SUFFIXES openblas cblas blis
  )

# Finds the library
find_library(CBLAS_LIBRARIES NAMES accelerate openblas cblas blas blis
  HINTS CBLAS_ROOT ENV CBLAS_ROOT
  PATHS ${LIB_INSTALL_DIR} ${CMAKE_INSTALL_PREFIX}/lib
  PATH_SUFFIXES openblas cblas blis
  )

# Determines whether or not BLAS was found
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CBLAS
  "Could NOT find a BLAS compatible library or 'cblas.h', install BLAS or set CBLAS_ROOT."
  CBLAS_INCLUDE_DIRS CBLAS_LIBRARIES)

mark_as_advanced(CBLAS_LIBRARIES CBLAS_INCLUDE_DIRS)
