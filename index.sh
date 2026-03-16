#!/bin/bash

bsa() {
  ## Begin Setup ##

  ##
  # The code to calculate `BASH_SCRIPTS_ADMIN_ROOT` used to be function like so before. I was not aware of unsetting variables at that time.
  # __bash_scripts_admin_resolve_current_script_folder_path() {
  #   # https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
  #   # https://gist.github.com/tvlooy/cbfbdb111a4ebad8b93e
  #   # Test 3: overcomplicated stackoverflow solution
  #
  #   # ...
  #
  #   echo ${FOLDER}
  # }
  local SOURCE="${BASH_SOURCE[0]}"
  local FOLDER=""

  while [ -h "${SOURCE}" ]; do
    FOLDER="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

    SOURCE="$(readlink "${SOURCE}")"

    [[ ${SOURCE} != /* ]] && SOURCE="${FOLDER}/${SOURCE}"
  done

  FOLDER="$(cd -P "$(dirname "${SOURCE}" )" && pwd)"

  BASH_SCRIPTS_ADMIN_ROOT="${FOLDER}"

  ##
  # The main entry point of the 'bash_scripts_admin'.
  #
  # IMPORTANT: 'bash_scripts_admin' is currently tested only on the macOS flavor of bash.
  #
  # Imports all 'bash_scripts_admin' commands.
  #
  . "${BASH_SCRIPTS_ADMIN_ROOT}/commands/index.sh"

  ## End Setup ##

  ## Begin Main ##

	local EXIT_CODE=0

	case "$1" in
		directive)
			case "$2" in
				add)    shift 2; bash_scripts_add_directive "$@" ;;
				remove) shift 2; bash_scripts_remove_directive "$@" ;;
				*)      echo "Unknown directive verb: $2"; bash_scripts_help; EXIT_CODE=1 ;;
			esac
			;;
		project)
			case "$2" in
				refresh) bash_scripts_refresh_project ;;
				erase)   bash_scripts_erase_project ;;
				*)       echo "Unknown project verb: $2"; bash_scripts_help; EXIT_CODE=1 ;;
			esac
			;;
		provision)
			case "$2" in
				load) shift 2; bash_scripts_load_provision "$@" ;;
				*)    echo "Unknown provision verb: $2"; bash_scripts_help; EXIT_CODE=1 ;;
			esac
			;;
		editor)
			case "$2" in
				open)  bash_scripts_open_editor ;;
				admin) bash_scripts_admin_open_editor ;;
				*)     echo "Unknown editor verb: $2"; bash_scripts_help; EXIT_CODE=1 ;;
			esac
			;;
		help|"")
			bash_scripts_help
			;;
		*)
			echo "Unknown command: $1"
			bash_scripts_help
			EXIT_CODE=1
			;;
	esac

  ## End Main ##

  ## Begin Teardown ##

	. "${BASH_SCRIPTS_ADMIN_ROOT}/unload_index.sh"

	unset BASH_SCRIPTS_ADMIN_ROOT

	return "${EXIT_CODE}"

  ## End Teardown ##
}

# When BASH_SCRIPTS_TEST is set to true, resets the 'bash_scripts'. For testing purposes only !!!
if [ "${BASH_SCRIPTS_TEST}" = "true" ]; then
	bsa project erase
fi

bsa project refresh
