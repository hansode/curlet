#!/bin/bash
#
# requires:
#   bash
#

## include files

. ${BASH_SOURCE[0]%/*}/helper_shunit2.sh

## variables

## functions

function test_data_type() {
  assertEquals "--data" "$(data_type)"
}

## shunit2

. ${shunit2_file}
