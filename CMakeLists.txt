cmake_minimum_required(VERSION 3.4...3.18)
project(c_plus_plus_template)

set (CMAKE_CXX_STANDARD 17)


#---------------------------------------------------------------------
#       [ Include、Lib  : Define ] ==> []
#---------------------------------------------------------------------

set(COMMON_LIB_DIR "${PROJECT_SOURCE_DIR}/lib/")

set(COMMON_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include"
                        "${PROJECT_SOURCE_DIR}/src"        )

link_directories(${COMMON_LIB_DIR})
include_directories( ${COMMON_INCLUDE_DIR} )

#---------------------------------------------------------------------
#       [ Include、Lib  : Path ] ==> [ glib opencv ]
#---------------------------------------------------------------------
find_package(PkgConfig)
pkg_search_module(GLIB REQUIRED glib-2.0)
include_directories(${GLIB_INCLUDE_DIRS})

find_package( OpenCV REQUIRED )    
include_directories( ${OpenCV_INCLUDE_DIRS} )

#---------------------------------------------------------------------
#               [ bin ] ==> [ main ]
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#               [ bin ] ==> [ demo ]
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#               [ bin ] ==> [ test ]
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#               [ lib ] ==> [ ]
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#        [ Install -->  ] ==> [  ]
#---------------------------------------------------------------------
message("Install Prefix : [${CMAKE_INSTALL_PREFIX}]")

install(TARGETS ${PROJECT_NAME} 
        RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}
        LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX})
