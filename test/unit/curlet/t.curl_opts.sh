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
  function request_header() { :; }
}

### opts

function test_curl_opts() {
  assertEquals "-fsSkL" "$(curl_opts)"
}

## shunit2

. ${shunit2_file}
