#!/bin/bash

#######################################
# Returns the path of the root folder of the 'bash-scripts-admin'.
#
# If no value is set to the global BASH_SCRIPTS_ADMIN_PARENT_FOLDER variable,
# '${HOME}/Projects/' will be used instead.
#
# NOTE: This function should be invoked like so: '$(bash-scripts-admin-root-path)'.
# NOTE: Definition of this function should be located before 'source "$(bash-scripts-admin-root-path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
#
#######################################
bash-scripts-admin-root-path() {
	local BASH_SCRIPTS_ADMIN_NAME="bash_scripts_admin"

	if [[ -z "${BASH_SCRIPTS_ADMIN_PARENT_FOLDER}" ]]; then
		echo "${HOME}/Projects/${BASH_SCRIPTS_ADMIN_NAME}"
	else
		echo "${BASH_SCRIPTS_ADMIN_PARENT_FOLDER}/${BASH_SCRIPTS_ADMIN_NAME}"
	fi
}

#######################################
# Returns the path of the root folder of the 'bash-scripts'.
#
# If no value is set to the global BASH_SCRIPTS_PARENT_FOLDER variable,
# '${HOME}/Projects/' will be used instead.
#
# NOTE: This function should be invoked like so: '$(bash-scripts-root-path)'.
# NOTE: Definition of this function should be located before 'source "$(bash-scripts-root-path)/commands/index.sh"'.
#
# DOCS: For returning values from bash functions see https://www.linuxjournal.com/content/return-values-bash-functions
#
#######################################
bash-scripts-root-path() {
	local BASH_SCRIPTS_NAME="bash_scripts"

	if [[ -z "${BASH_SCRIPTS_PARENT_FOLDER}" ]]; then
		echo "${HOME}/Projects/${BASH_SCRIPTS_NAME}"
	else
		echo "${BASH_SCRIPTS_PARENT_FOLDER}/${BASH_SCRIPTS_NAME}"
	fi
}

##
# The main entry point of the 'bash-scripts-admin'.
#
# IMPORTANT: 'bash-scripts-admin' is currently tested only on the macOS flavor of bash.

# Imports all 'bash-scripts-admin' commands.
source "$(bash-scripts-admin-root-path)/commands/index.sh"

# When BASH_SCRIPTS_TEST is set to true, resets the 'bash-scripts'. For testing purposes only !!!
if [[ "${BASH_SCRIPTS_TEST}" == "true" ]]; then
	bash-scripts-erase-project
fi

bash-scripts-refresh-project
