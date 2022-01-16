##
# Resolves root path. Depends on SETUP_ARGS.
#
resolve_root_folder_path() {
  local ROOT_PATH="${SETUP_ARGS[0]}"

  echo ${ROOT_PATH}
}

##
# Loads command from a file. For example:
#
#   load_command "paths/root_path"
#   # => Loads "commands/paths/root_path.sh"
#
# Command should be located in the "commands" directory and have the ".sh" extension.
#
load_command() {
  local PATH="${1}"

  . "$(resolve_root_folder_path)/commands/${PATH}.sh"
}

##
# Executes a script from file and exits. For example:
#
#   run_entry "root_path"
#   # => Executes "entries/root_path.sh"
#
# Entry should be located in the "entries" directory and have ".sh" extension.
# If any of the commands from entry fails, it exits immediately even without trying to execute the rest commands.
#
# Passes any additional arguments to entry.
#
#   run_entry "root_path" "log"
#
# "log" will be available as ${1} in root_path.sh.
#
# https://linuxize.com/post/bash-source-command/#source-command-syntax
# > If any ARGUMENTS are given, they will become positional parameters to the FILENAME.
#
run_entry() {
  local PATH="${1}"
  local ADDITIONAL_ARGS="${@:2}"

  ##
  # Forces the shell to exit immediately if any of its commands return a non-zero status.
  # (https://www.gnu.org/software/bash/manual/bash.html#The-Set-Builtin)
  #
  set -e

  . "$(resolve_root_folder_path)/entries/${PATH}.sh" ${ADDITIONAL_ARGS}

  exit
}
