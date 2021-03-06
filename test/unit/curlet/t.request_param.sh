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

function test_request_param_no_opts() {
  request_param >/dev/null
  assertEquals 0 ${?}
}

function test_request_param_defined_http() {
  local path=http://example.com/api

  assertEquals ${path} $(request_param ${path})
}

function test_request_param_defined_file() {
  local path=file:///dev/null

  assertEquals ${path} $(request_param ${path})
}


## shunit2

. ${shunit2_file}
