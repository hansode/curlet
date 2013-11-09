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
  function rc_path() { echo ${BASH_SOURCE[0]%/*}/rc.$$; }

  API_HOST=
  API_PORT=

  api_host=192.0.2.10
  api_port=9001

  cat <<-EOS > $(rc_path)
	API_HOST=${api_host}
	API_PORT=${api_port}
	EOS
}

function tearDown() {
  rm -f $(rc_path)
}

function test_load_rc() {
  load_rc
  assertEquals 0 $?

  assertEquals "${API_HOST}" "${api_host}"
  assertEquals "${API_PORT}" "${api_port}"
}

## shunit2

. ${shunit2_file}
