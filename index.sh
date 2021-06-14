#!/bin/bash

#######################################
# Returns the path of the root folder of the 'bash_scripts_admin'.
#
# If no value is set to the global BASH_SCRIPTS_ADMIN_PARENT_FOLDER variable,
# '${HOME}/Projects/' will be used instead.
#
# NOTE: This function should be invoked like so: '$(bash_scripts_admin_root_path)'.
# NOTE: Definition of this function should be located before '. "$(bash_scripts_admin_root_path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
#
#######################################
bash_scripts_admin_root_path() {
	local BASH_SCRIPTS_ADMIN_NAME="bash_scripts_admin"

	if [ -z "${BASH_SCRIPTS_ADMIN_PARENT_FOLDER}" ]; then
		echo "${HOME}/Projects/${BASH_SCRIPTS_ADMIN_NAME}"
	else
		echo "${BASH_SCRIPTS_ADMIN_PARENT_FOLDER}/${BASH_SCRIPTS_ADMIN_NAME}"
	fi
}

#######################################
# Returns the path of the root folder of the 'bash_scripts'.
#
# If no value is set to the global BASH_SCRIPTS_PARENT_FOLDER variable,
# '${HOME}/Projects/' will be used instead.
#
# NOTE: This function should be invoked like so: '$(bash_scripts_root_path)'.
# NOTE: Definition of this function should be located before '. "$(bash_scripts_root_path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
#
#######################################
bash_scripts_root_path() {
	local BASH_SCRIPTS_NAME="bash_scripts"

	if [ -z "${BASH_SCRIPTS_PARENT_FOLDER}" ]; then
		echo "${HOME}/Projects/${BASH_SCRIPTS_NAME}"
	else
		echo "${BASH_SCRIPTS_PARENT_FOLDER}/${BASH_SCRIPTS_NAME}"
	fi
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
