cmake_minimum_required(VERSION 3.4.3)

project(QirPasses)
set(CMAKE_BUILD_TYPE "Debug")
option(MICROSOFT_ENABLE_TESTS               "Enable test targets"   ON)
option(MICROSOFT_ENABLE_DYNAMIC_LOADING     "Use dynamic loading"   ON)
option(MICROSOFT_GENERATE_COVERAGE          "Generate coverage"     OFF)

# Microsoft Settings
set(MICROSOFT_ROOT_PASSES_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(MICROSOFT_ROOT_VENDOR_DIR ${MICROSOFT_ROOT_PASSES_DIR}/vendors)
message(STATUS "Passes dir: ${MICROSOFT_ROOT_PASSES_DIR}")
message(STATUS "Vendor dir: ${MICROSOFT_ROOT_VENDOR_DIR}")

include(CheckCXXCompilerFlag)

set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address,undefined -g -O0 -fno-sanitize-recover=all")
set (CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address,undefined  -g -O0 -fno-sanitize-recover=all")
set (CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fno-omit-frame-pointer -fsanitize=address,undefined -g -O3 -fno-sanitize-recover=all")
set (CMAKE_LINKER_FLAGS_RELEASE "${CMAKE_LINKER_FLAGS_RELEASE} -fno-omit-frame-pointer -fsanitize=address,undefined  -g -O3 -fno-sanitize-recover=all")




include(ExternalProject)
# Environment variables
# Download vars
# - QIRLIB_DOWNLOAD_LLVM => If set, download pre-built LLVM binaries.
# - QIRLIB_LLVM_BUILDS_URL => URL root where downloads are hosted.
# - QIRLIB_LLVM_PKG_NAME => name of package to be downloaded/created
# - CPACK_PACKAGE_FILE_NAME
# Build vars
# - QIRLIB_LLVM_TAG
# Both
# - CMAKE_INSTALL_PREFIX
message(STATUS "Install LLVM: ${CMAKE_BINARY_DIR}/llvm")

  # The outer cmake call from rust will configure CMAKE_INSTALL_PREFIX
  # Unless the user overrides the install path rust will configure it to 
  # be the crate OUT_DIR.
  # The build will define CPACK_PACKAGE_FILE_NAME passing it to the LLVM build.
  set (EXTERNAL_EXTRA_CMAKE_ARGS)
  list (APPEND EXTERNAL_EXTRA_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/llvm
    -DCPACK_PACKAGE_FILE_NAME=${CPACK_PACKAGE_FILE_NAME}
    -DLLVM_ENABLE_ASSERTIONS=On
    -DLLVM_ENABLE_RTTI=On
    -DCMAKE_BUILD_TYPE=Debug    
  )

  ExternalProject_Add(llvm
    GIT_REPOSITORY    https://github.com/llvm/llvm-project.git
    GIT_TAG           "llvmorg-13.0.1"
    GIT_SHALLOW       TRUE
    GIT_PROGRESS      TRUE
    SOURCE_SUBDIR     llvm
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -C ${CMAKE_CURRENT_LIST_DIR}/cmake/Llvm.cmake ${EXTERNAL_EXTRA_CMAKE_ARGS} <SOURCE_DIR><SOURCE_SUBDIR>
    BUILD_COMMAND     make
    USES_TERMINAL_DOWNLOAD  TRUE
    USES_TERMINAL_CONFIGURE TRUE
    USES_TERMINAL_BUILD     TRUE
    USES_TERMINAL_INSTALL   TRUE
  )

#  ExternalProject_Add_Step(llvm package
#    COMMAND           make package
#    WORKING_DIRECTORY <BINARY_DIR>
#    COMMENT           "package llvm"
#    DEPENDEES         build configure
#    ALWAYS            TRUE
#    EXCLUDE_FROM_MAIN TRUE
#    USES_TERMINAL     TRUE
#  )
#  ExternalProject_Add_StepTargets(llvm package)






# -fvisibility-inlines-hidden is set when building LLVM and on Darwin warnings
# are triggered if the passes library is built without this flag (though otherwise it
# builds fine). For consistency, add it here too.
check_cxx_compiler_flag("-fvisibility-inlines-hidden" SUPPORTS_FVISIBILITY_INLINES_HIDDEN_FLAG)
if(${SUPPORTS_FVISIBILITY_INLINES_HIDDEN_FLAG})
  if (${SUPPORTS_FVISIBILITY_INLINES_HIDDEN_FLAG} STREQUAL "1")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility-inlines-hidden")
  endif()
endif()


# Helper variable to determine if we are using Clang compiler
set(using_clang_compiler FALSE)
if ( "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(using_clang_compiler TRUE)
endif ()

# Add compiler flags if we are 
if (MICROSOFT_GENERATE_COVERAGE)
    message(STATUS "Generating coverage data")
    
    if (using_clang_compiler)
      # Generating coverage output
      set(CMAKE_CXX_FLAGS_DEBUG "-g -fprofile-instr-generate -fcoverage-mapping -O0")

      # Forcing debug build
      set(CMAKE_BUILD_TYPE "Debug")
    else ()
      message(SEND_ERROR "Coverage flag enabled but Clang compiler not found, CMake will exit.")
    endif ()
endif (MICROSOFT_GENERATE_COVERAGE)



if(MICROSOFT_ENABLE_TESTS)
  add_subdirectory(${MICROSOFT_ROOT_VENDOR_DIR}/googletest)
  target_compile_options(gmock
                             INTERFACE
                             -Wno-everything)
  target_compile_options(gtest
                             INTERFACE
                             -Wno-everything)

endif(MICROSOFT_ENABLE_TESTS)


# Setting the standard configuration for the C++ compiler
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Weverything -Wconversion -Wno-c++98-compat-pedantic -Wno-c++98-compat -Wno-padded -Wno-exit-time-destructors -Wno-global-constructors")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-documentation-unknown-command")

include(${MICROSOFT_ROOT_PASSES_DIR}/cmake/Testing.cmake)
include(${MICROSOFT_ROOT_PASSES_DIR}/cmake/Library.cmake)

# We export the compile commands which are needed by clang-tidy 
# to run the static analysis
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# LLVM is normally built without RTTI. Be consistent with that.
# find_package(LLVM REQUIRED CONFIG)
# message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
# message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
# 
# if(NOT LLVM_ENABLE_RTTI)
#   message(STATUS "RTTI is off")
#   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
# else()
#   message(STATUS "RTTI is on")
# endif()


# Adding LLVM include directories. We may choose
# to move this to a module level at a later point
include_directories(${CMAKE_BINARY_DIR}/llvm/include)
link_directories(${CMAKE_BINARY_DIR}/llvm/lib)

# include_directories(${LLVM_INCLUDE_DIRS})
# link_directories(${LLVM_LIBRARY_DIRS})
# add_definitions(${LLVM_DEFINITIONS})
include_directories(${CMAKE_SOURCE_DIR})
# llvm_map_components_to_libnames(llvm_libs support core irreader passes orcjit x86asmparser x86codegen x86desc x86disassembler x86info interpreter objcarcopts)

set(llvm_libs 
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVM.dylib"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64AsmParser.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64CodeGen.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64Desc.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64Disassembler.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64Info.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAArch64Utils.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAggressiveInstCombine.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAnalysis.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAsmParser.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMAsmPrinter.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMBinaryFormat.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMBitReader.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMBitWriter.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMBitstreamReader.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCFGuard.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCFIVerify.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCodeGen.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCore.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCoroutines.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMCoverage.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDWARFLinker.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDWP.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDebugInfoCodeView.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDebugInfoDWARF.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDebugInfoGSYM.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDebugInfoMSF.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDebugInfoPDB.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDemangle.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMDlltoolDriver.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMExecutionEngine.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMExegesis.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMExegesisAArch64.a"
#  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMExegesisX86.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMExtensions.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMFileCheck.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMFrontendOpenACC.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMFrontendOpenMP.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMFuzzMutate.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMGlobalISel.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMIRReader.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMInstCombine.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMInstrumentation.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMInterfaceStub.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMInterpreter.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMJITLink.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMLTO.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMLibDriver.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMLineEditor.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMLinker.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMC.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMCA.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMCDisassembler.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMCJIT.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMCParser.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMMIRParser.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMObjCARCOpts.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMObject.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMObjectYAML.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMOption.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMOrcJIT.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMOrcShared.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMOrcTargetProcess.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMPasses.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMProfileData.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMRemarks.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMRuntimeDyld.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMScalarOpts.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMSelectionDAG.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMSupport.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMSymbolize.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMTableGen.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMTableGenGlobalISel.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMTarget.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMTextAPI.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMTransformUtils.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMVectorize.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMWindowsManifest.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMXRay.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMipo.a"
  "${CMAKE_BINARY_DIR}/llvm/lib/libLTO.dylib"
)

# "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMX86AsmParser.a"
# "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMX86CodeGen.a"
# "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMX86Desc.a"
# "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMX86Disassembler.a"
# "${CMAKE_BINARY_DIR}/llvm/lib/libLLVMX86Info.a"

message(STATUS "${llvm_libs}")
# Adding the libraries
add_subdirectory(qir/qat)

add_subdirectory(ComponentExamples)
