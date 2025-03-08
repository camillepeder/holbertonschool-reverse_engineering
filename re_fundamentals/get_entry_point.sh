#!/bin/bash

if [[ $? -ne 0 ]]; then
	echo 'File does not exist'
	exit 1
fi

. ./messages.sh

getMagic=$(readelf -h $1 | grep -E 'Magic' | awk '{split($0, a, ":"); print a[2]}')
getClass=$(readelf -h $1 | grep -E 'Class' | awk '{split($0, a, ":"); print a[2]}')
getByte=$(readelf -h $1 | grep -E 'Data' | awk '{split($0, a, ","); print a[2]}')
getEntry=$(readelf -h $1 | grep -E 'address' | awk '{split($0, a, ":"); print a[2]}')


file_name=$1
magic_number=$(echo $getMagic)
class=$(echo $getClass)
byte_order=$(echo $getByte)
entry_point_address=$(echo $getEntry)
display_elf_header_info
