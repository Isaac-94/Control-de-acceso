# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Espressif/frameworks/esp-idf-v5.2.1-4/components/bootloader/subproject"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/tmp"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/src/bootloader-stamp"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/src"
  "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/Usuario/Documents/esp32s3/mqtt-tcp/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
