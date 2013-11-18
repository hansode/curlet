#!/bin/bash
#
# requires:
#   bash
#

## include files

. ${BASH_SOURCE[0]%/*}/helper_shunit2.sh

## variables

## functions

function setUp() {
  :
}

function test_urlencode_data_no_opts() {
  urlencode_data >/dev/null
  assertEquals 0 ${?}
}

function test_urlencode_data_opts_single() {
  assertEquals "--data-urlencode key=val" "$(urlencode_data key=val)"
}

function test_urlencode_data_opts_multi() {
  assertEquals    "--data-urlencode key=val --data-urlencode foo=bar" "$(urlencode_data key=val foo=bar)"
  assertNotEquals "--data-urlencode foo=bar --data-urlencode key=val" "$(urlencode_data key=val foo=bar)"
}

## shunit2

. ${shunit2_file}
