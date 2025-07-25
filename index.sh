#!/bin/bash

#######################################
# Returns the path of the root folder of the 'bash_scripts_admin'.
#
# NOTE: This function should be invoked like so: '$(bash_scripts_admin_root_path)'.
# NOTE: Definition of this function should be located before '. "$(bash_scripts_admin_root_path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
#
#######################################
bash_scripts_admin_root_path() {
	echo "$(__bash_scripts_admin_resolve_current_script_folder_path)"
}

#######################################
# Returns the path of the root folder of the 'bash_scripts'.
#
# NOTE: This function should be invoked like so: '$(bash_scripts_root_path)'.
# NOTE: Definition of this function should be located before '. "$(bash_scripts_root_path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
# DOCS: For deleting a suffix from a string see https://stackoverflow.com/a/16623897/12201472
#
#######################################
bash_scripts_root_path() {
	local CURRENT_SCRIPT_FOLDER_PATH="$(__bash_scripts_admin_resolve_current_script_folder_path)"

	echo "${CURRENT_SCRIPT_FOLDER_PATH%"_admin"}"
}

__bash_scripts_admin_resolve_current_script_folder_path() {
	# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
	# https://gist.github.com/tvlooy/cbfbdb111a4ebad8b93e
	# Test 3: overcomplicated stackoverflow solution
	local SOURCE="${BASH_SOURCE[0]}"
	local FOLDER=""

	while [ -h "${SOURCE}" ]; do
		FOLDER="$(cd -P "$(dirname "${SOURCE}")" && pwd)"

		SOURCE="$(readlink "${SOURCE}")"

		[[ ${SOURCE} != /* ]] && SOURCE="${FOLDER}/${SOURCE}"
	done

	FOLDER="$(cd -P "$(dirname "${SOURCE}" )" && pwd)"

	echo ${FOLDER}
}

##
# The main entry point of the 'bash_scripts_admin'.
#
# IMPORTANT: 'bash_scripts_admin' is currently tested only on the macOS flavor of bash.

# Imports all 'bash_scripts_admin' commands.
. "$(bash_scripts_admin_root_path)/commands/index.sh"

# When BASH_SCRIPTS_TEST is set to true, resets the 'bash_scripts'. For testing purposes only !!!
if [ "${BASH_SCRIPTS_TEST}" = "true" ]; then
	bash_scripts_erase_project
fi

bash_scripts_refresh_project
