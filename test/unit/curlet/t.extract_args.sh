#!/bin/bash
#
# requires:
#   bash
#

## include files

. ${BASH_SOURCE[0]%/*}/helper_shunit2.sh

## variables

## functions

function test_extract_args_commands_success() {
  local opts="a b c d"

  extract_args ${opts}
  assertEquals "${opts}" "${COMMAND_ARGS}"
}

function test_extract_args_options_success() {
  local commands="command sub-command"
  local options="--key0=value0 --key1=value1"
  local opts="${commands} ${options}"

  extract_args ${opts}
  assertEquals "${commands}" "${COMMAND_ARGS}"
}

function test_extract_args_underbar_to_hyphen() {
  local commands="command sub-command"
  local options="--k-e-y-0=value0 --k-e-y-1=value1"
  local opts="${commands} ${options}"

  extract_args ${opts}
  assertEquals "${commands}" "${COMMAND_ARGS}"

  assertEquals "${k_e_y_0}" "value0"
  assertEquals "${k_e_y_1}" "value1"
}

function test_extract_args_commands_simple_opts() {
  local overwrite= diskless= disk_less=
  local opts="--overwrite --diskless --disk-less"

  extract_args ${opts}

  assertEquals "${overwrite}" "1"
  assertEquals "${diskless}"  "1"
  assertEquals "${disk_less}" "1"
}

function test_extract_args_commands_complex_opts() {
  local overwrite= diskless= disk_less= COMMAND_DRY_RUN=
  local opts="--overwrite --diskless yes --disk-less no --COMMAND-DRY-RUN"

  extract_args ${opts}

  assertEquals "${overwrite}" "1"
  assertEquals "${diskless}"  "yes"
  assertEquals "${disk_less}" "no"
  assertEquals "${COMMAND_DRY_RUN}"   "1"
}

function test_extract_args_commands_same_opts() {
  local addpkg=
  local opts="--addpkg openssh-server --addpkg openssh-clients"

  extract_args ${opts}

  assertEquals "${addpkg}"  "openssh-server openssh-clients"
}

function test_extract_args_commands_same_opts2() {
  local addpkg=
  extract_args --addpkg openssh-server --addpkg openssh-clients
  assertEquals "openssh-server openssh-clients" "${addpkg}"
}

function test_extract_args_space_included() {
  local title=
  local value="foo baaar"

  extract_args --title="${value}"
  assertEquals "${title}" "${value}"
}

function test_extract_args_space_included2() {
  local title=
  local value="foo baaar"

  extract_args --title "${value}"
  assertEquals "${title}" "${value}"
}

## shunit2

. ${shunit2_file}
