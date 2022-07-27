function (generate_version_header)

  execute_process(COMMAND git describe --dirty=-wip  --always
                  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                  OUTPUT_VARIABLE MICROSOFT_VERSION_FULL
                  OUTPUT_STRIP_TRAILING_WHITESPACE)


    string(REGEX
           REPLACE "v\\.?[ ]?[0-9]+\\.[0-9]+\\.[0-9]+(\\-.*)"
                   "\\1"
                   version_details
                   "${MICROSOFT_VERSION_FULL}")


    string(REPLACE "${version_details}" "" 
                    version_core
                   "${MICROSOFT_VERSION_FULL}")


    # cmake regex processing to extract all meaningful elements
    if(version_core)        
        string(REGEX
               REPLACE "v\\.?[ ]?([0-9]+)\\..*"
                       "\\1"
                       MICROSOFT_VERSION_MAJOR
                       "${version_core}")
        string(REGEX
               REPLACE "v\\.?[ ]?[0-9]+\\.([0-9]+)\\..*"
                       "\\1"
                       MICROSOFT_VERSION_MINOR
                       "${version_core}")
        string(REGEX
               REPLACE "v\\.?[ ]?[0-9]+\\.[0-9]+\\.([0-9]+)"
                       "\\1"
                       MICROSOFT_VERSION_REVISION
                       "${version_core}")


        string(REGEX
               REPLACE ".*\\-(wip)"
                       "\\1"
                       MICROSOFT_VERSION_WIP_MATCH
                       "${version_details}")

        if(MICROSOFT_VERSION_WIP_MATCH STREQUAL "wip")
            set(MICROSOFT_VERSION_WIP "true")
            string(REGEX
                   REPLACE "(.*)\\-wip"
                           "\\1"
                           version_details
                           "${version_details}")     


        string(REGEX
               REPLACE  ".*\\-g([a-zA-Z0-9]+)"
                       "\\1"
                       MICROSOFT_VERSION_COMMIT
                       "${version_details}")
        string(REGEX
               REPLACE "(.*)\\-g[a-zA-Z0-9]+"
                       "\\1"
                       version_details
                       "${version_details}")        

        set(MICROSOFT_VERSION_PATCH "")
        if(version_details)    
            string(REGEX
                   REPLACE ".*\\-([0-9]+)"
                           "\\1"
                           MICROSOFT_VERSION_PATCH
                           "${version_details}")
            string(REGEX
                   REPLACE "(.*)\\-[0-9]+"
                           "\\1"
                           version_details
                           "${version_details}") 
        endif()


        set(MICROSOFT_VERSION_CHANNEL "release")
        if(version_details)    
            string(REGEX
                   REPLACE ".*\\-([a-zA-Z0-9]+)"
                           "\\1"
                           MICROSOFT_VERSION_CHANNEL
                           "${version_details}")
            string(REGEX
                   REPLACE "(.*)\\-[a-zA-Z0-9]+"
                           "\\1"
                           version_details
                           "${version_details}")             
        endif()


   
        else()
            set(MICROSOFT_VERSION_WIP "false")
        endif()

    else()
        set(MICROSOFT_VERSION_MAJOR "0")
        set(MICROSOFT_VERSION_MINOR "0")
        set(MICROSOFT_VERSION_REVISION "0")
        set(MICROSOFT_VERSION_PATCH "0")
        set(MICROSOFT_VERSION_CHANNEL "release")
        set(MICROSOFT_VERSION_COMMIT MICROSOFT_VERSION_FULL)
        set(MICROSOFT_VERSION_WIP "false")        
    endif()                               

    set(MICROSOFT_VERSION_FULL "${MICROSOFT_VERSION_MAJOR}.${MICROSOFT_VERSION_MINOR}.${MICROSOFT_VERSION_REVISION}")

    if(MICROSOFT_VERSION_CHANNEL AND NOT (MICROSOFT_VERSION_CHANNEL STREQUAL "release"))
        set(MICROSOFT_VERSION_FULL "${MICROSOFT_VERSION_FULL}-${MICROSOFT_VERSION_CHANNEL}")
    endif()

    if(MICROSOFT_VERSION_PATCH AND NOT (MICROSOFT_VERSION_PATCH STREQUAL "0"))
        set(MICROSOFT_VERSION_FULL "${MICROSOFT_VERSION_FULL}-patch-${MICROSOFT_VERSION_PATCH}-${MICROSOFT_VERSION_COMMIT}")
    endif()

    if(MICROSOFT_VERSION_WIP STREQUAL "true")
        set(MICROSOFT_VERSION_FULL "${MICROSOFT_VERSION_FULL}-wip")
    endif()
    message("Version: ${MICROSOFT_VERSION_FULL}")
    configure_file(${CMAKE_SOURCE_DIR}/qir/qat/Version/Version.tpl.hpp
                 ${CMAKE_BINARY_DIR}/qir/qat/Version/Version.hpp)
    include_directories(${CMAKE_BINARY_DIR})    
endfunction ()