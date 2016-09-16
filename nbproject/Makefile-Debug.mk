#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/BlockMatrixOps.o \
	${OBJECTDIR}/MatMul.o \
	${OBJECTDIR}/MatrixOps.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-fopenmp -O3
CXXFLAGS=-fopenmp -O3

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk MatMul_zirkleac

MatMul_zirkleac: ${OBJECTFILES}
	${LINK.cc} -o MatMul_zirkleac ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/BlockMatrixOps.o: BlockMatrixOps.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../build/include -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/BlockMatrixOps.o BlockMatrixOps.cpp

${OBJECTDIR}/MatMul.o: MatMul.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../build/include -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MatMul.o MatMul.cpp

${OBJECTDIR}/MatrixOps.o: MatrixOps.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I../build/include -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/MatrixOps.o MatrixOps.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} MatMul_zirkleac

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
