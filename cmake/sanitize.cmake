option (SANITIZE "Enable sanitizer: address, memory, thread, undefined" "")

set (SAN_FLAGS "${SAN_FLAGS} -g -fno-omit-frame-pointer -DSANITIZER")

if (SANITIZE)
    if (SANITIZE STREQUAL "address")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SAN_FLAGS} -fsanitize=address -fsanitize-address-use-after-scope")
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SAN_FLAGS} -fsanitize=address -fsanitize-address-use-after-scope")
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address -fsanitize-address-use-after-scope")
        endif()
        if (MAKE_STATIC_LIBRARIES AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libasan")
        endif ()

    elseif (SANITIZE STREQUAL "memory")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SAN_FLAGS} -fsanitize=memory -fsanitize-memory-track-origins")
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SAN_FLAGS} -fsanitize=memory -fsanitize-memory-track-origins")
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=memory")
        endif()
        if (MAKE_STATIC_LIBRARIES AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libmsan")
        endif ()

    elseif (SANITIZE STREQUAL "thread")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SAN_FLAGS} -fsanitize=thread")
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SAN_FLAGS} -fsanitize=thread")
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=thread")
        endif()
        if (MAKE_STATIC_LIBRARIES AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libtsan")
        endif ()

    elseif (SANITIZE STREQUAL "undefined")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SAN_FLAGS} -fsanitize=undefined -fno-sanitize-recover=all")
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SAN_FLAGS} -fsanitize=undefined -fno-sanitize-recover=all")
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=undefined")
        endif()
        if (MAKE_STATIC_LIBRARIES AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libubsan")
        endif ()
    else ()
        message (FATAL_ERROR "Unknown sanitizer type: ${SANITIZE}")
    endif ()
endif()
