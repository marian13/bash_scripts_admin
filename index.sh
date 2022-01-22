#!/bin/bash

##
# IMPORTANT: Parentheses are used here to avoid the exposure
# of temporal variables and functions to the outer scope.
#
(
  ##
  # Setup
  #
  # SETUP_ARGS[0] - Stores value of the root path.
  #
  # Based on "Test 5: via readlink with space"
  # https://gist.github.com/tvlooy/cbfbdb111a4ebad8b93e
  #
  # NOTE: If you decide to move this logic into "commands/setup.sh"
  # you will receive "readlink: command not found" and "dirname: command not found" errors.
  # TODO: Currently it is not clear why those errors happen.
  #
  # NOTE: Check the comment by tvlooy. It explains why accepted SO answer is NOT the best.
  # https://stackoverflow.com/a/246128/12201472
  #
  # NOTE: How to check whether macOS host?
  # https://stackoverflow.com/a/54285201/12201472
  #
  # NOTE: greadlink is GNU readlink for macOS.
  # https://stackoverflow.com/a/4031502/12201472
  #
  if [[ "${OSTYPE}" == "darwin"* ]]; then
    SETUP_ARGS[0]="$(dirname "$(greadlink -f ${0})")" # ROOT_PATH
  else
    SETUP_ARGS[0]="$(dirname "$(readlink -f ${0})")" # ROOT_PATH
  fi

  . "./commands/setup.sh"

  ##
  # Main
  #
  # NOTE: ${@} stores all current script arguments except ${0}.
  #
  MAIN_ARGS=${@}

  . "./entries/main.sh"
)
