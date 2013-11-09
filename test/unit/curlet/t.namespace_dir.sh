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
  function namespace_dir() { echo .; }
  namespace=shunit
}

function test_namespace_path() {
  assertEquals "./${namespace}.sh" "$(namespace_path)"
}

## shunit2

. ${shunit2_file}
