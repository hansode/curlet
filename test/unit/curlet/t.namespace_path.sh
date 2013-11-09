#!/bin/bash
#
# requires:
#   bash
#

## include files

. ${BASH_SOURCE[0]%/*}/helper_shunit2.sh

## variables

## functions

function test_namespace_dir() {
  namespace_dir >/dev/null
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
