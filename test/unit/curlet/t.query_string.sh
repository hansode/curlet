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

function test_query_string_no_opts() {
  query_string >/dev/null
  assertEquals 0 $?
}

function test_query_string_opts_single() {
  assertEquals "key=val" "$(query_string key=val)"
}

function test_query_string_opts_multi() {
  assertEquals    "key=val&foo=bar" "$(query_string key=val foo=bar)"
  assertNotEquals "foo=bar&key=val" "$(query_string key=val foo=bar)"
}

## shunit2

. ${shunit2_file}
