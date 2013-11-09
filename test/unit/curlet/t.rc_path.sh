#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_rc_path_defined() {
  rc_path
  assertEquals $? 0
}

function test_rc_path_undefined() {
  function rc_path() { echo asdf; }
  assertEquals asdf $(rc_path)
}

## shunit2

. ${shunit2_file}
