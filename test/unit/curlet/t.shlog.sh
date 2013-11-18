#!/bin/bash
#
# requires:
#   bash
#

## include files

. ${BASH_SOURCE[0]%/*}/helper_shunit2.sh

## variables

## functions

#
# COMMAND_LOGLEVEL:debug
#
test_shlog_COMMAND_LOGLEVEL_debug_success() {
  assertEquals \
        "${COMMAND_PROMPT} echo hello
hello" \
   "$(COMMAND_LOGLEVEL=debug shlog echo hello)"
}

test_shlog_COMMAND_LOGLEVEL_debug_fail() {
  assertNotEquals \
        "${COMMAND_PROMPT} typo hello
hello" \
   "$(COMMAND_LOGLEVEL=debug shlog typo hello 2>/dev/null)"
}

#
# COMMAND_LOGLEVEL:info
#
test_shlog_COMMAND_LOGLEVEL_info_success() {
  local cmd="echo hello"
  assertEquals "hello" "$(COMMAND_LOGLEVEL=info shlog ${cmd})"
}

test_shlog_COMMAND_LOGLEVEL_info_fail() {
  local cmd="echo hello"
  assertNotEquals "${COMMAND_PROMPT} ${cmd}\n${cmd}" "$(COMMAND_LOGLEVEL=info shlog ${cmd})"
}

#
# COMMAND_LOGLEVEL:empty
#
test_shlog_COMMAND_LOGLEVEL_empty_success() {
  local cmd="echo hello"
  assertEquals "hello" "$(COMMAND_LOGLEVEL= shlog ${cmd})"
}

test_shlog_COMMAND_LOGLEVEL_empty_fail() {
  local cmd="echo hello"
  assertNotEquals "${COMMAND_PROMPT} ${cmd}\n${cmd}" "$(COMMAND_LOGLEVEL= shlog ${cmd})"
}

#
# command not found
#
test_shlog_command_not_found_success() {
  $(shlog typo hello 2>/dev/null)
  assertNotEquals 0 ${?}
}

#
# dry-run mode
#
test_shlog_dryrun_COMMAND_LOGLEVEL_default() {
  assertEquals "" "$(COMMAND_DRY_RUN=on           shlog date)"
  assertEquals "" "$(COMMAND_DRY_RUN=on COMMAND_LOGLEVEL= shlog date)"
}
test_shlog_dryrun_COMMAND_LOGLEVEL_debug_on() {
  assertEquals \
   "${COMMAND_PROMPT} echo hello" \
   "$(COMMAND_DRY_RUN=on COMMAND_LOGLEVEL=debug shlog echo hello)"
}
test_shlog_dryrun_COMMAND_LOGLEVEL_debug_y() {
  assertEquals \
   "${COMMAND_PROMPT} echo hello" \
   "$(COMMAND_DRY_RUN=y COMMAND_LOGLEVEL=debug shlog echo hello)"
}
test_shlog_dryrun_COMMAND_LOGLEVEL_debug_yes() {
  assertEquals \
   "${COMMAND_PROMPT} echo hello" \
   "$(COMMAND_DRY_RUN=yes COMMAND_LOGLEVEL=debug shlog echo hello)"
}
test_shlog_dryrun_COMMAND_LOGLEVEL_debug_on() {
  assertEquals \
   "${COMMAND_PROMPT} echo hello" \
   "$(COMMAND_DRY_RUN=on COMMAND_LOGLEVEL=debug shlog echo hello)"
}
test_shlog_dryrun_COMMAND_LOGLEVEL_debug_1() {
  assertEquals \
   "${COMMAND_PROMPT} echo hello" \
   "$(COMMAND_DRY_RUN=1 COMMAND_LOGLEVEL=debug shlog echo hello)"
}

## shunit2

. ${shunit2_file}
