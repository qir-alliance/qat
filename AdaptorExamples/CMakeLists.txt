add_library(HelloWorld SHARED HelloWorld/main.cpp)
add_dependencies(HelloWorld llvm)

if (WIN32)
  # Windows specific configure
  # TODO(issue-7): Add Windows specific configuration
elseif (APPLE)
  target_link_libraries(HelloWorld
    PUBLIC "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
else () 
  target_compile_options(HelloWorld
    PUBLIC "-fPIC")
endif ()


add_library(InlinePassAdaptor SHARED InlinePassAdaptor/main.cpp)
add_dependencies(InlinePassAdaptor llvm)

if (WIN32)
  # Windows specific configure
  # TODO(issue-7): Add Windows specific configuration  
elseif (APPLE)
  target_link_libraries(InlinePassAdaptor
    PUBLIC "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
else () 
  target_compile_options(InlinePassAdaptor
    PUBLIC "-fPIC")
endif ()



add_library(CArrayMap SHARED CArrayMap/main.cpp)
add_dependencies(CArrayMap llvm)
if (WIN32)
  # Windows specific configure
  # TODO(issue-7): Add Windows specific configuration  
elseif (APPLE)
  target_link_libraries(CArrayMap
    PUBLIC "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
else () 
  target_compile_options(CArrayMap
    PUBLIC "-fPIC")
endif ()