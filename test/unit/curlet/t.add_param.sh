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

function test_add_param_no_opts() {
  add_param >/dev/null 2>&1
  assertNotEquals 0 $?
}

function test_add_param_key_z() {
  add_param name
}

function test_add_param_key_n() {
  local name=i-xxx
  assertEquals "name='${name}'" "$(add_param name)"
}

function test_add_param_key_string() {
  local name=i-xxx
  assertEquals "name='${name}'" "$(add_param name string)"
}

function test_add_param_key_array() {
  local name=i-xxx
  assertEquals "name[]=${name}" "$(add_param name array)"
}

function test_add_param_key_array_multi() {
  local name="i-xxx i-yyy"
  assertNotEquals "$(for i in; do echo name[]=${i}; done)" "$(add_param name array)"
}

function test_add_param_key_strfile() {
  local name=i-xxx
  assertEquals "name='${name}'" "$(add_param name strfile)"
}

function test_add_param_key_strplain() {
  local name=i-xxx
  assertEquals "${name}" "$(add_param name strplain)"
}

function test_add_param_key_hash() {
  local name="inst_id=i-xxx"
  assertEquals "name[inst_id]=i-xxx" "$(add_param name hash)"
}

function test_add_param_key_hash_multi() {
  local name="inst_id=i-xxx addr=bar"
  assertEquals "name[inst_id]=i-xxx
name[addr]=bar" "$(add_param name hash)"
}

## shunit2

. ${shunit2_file}
