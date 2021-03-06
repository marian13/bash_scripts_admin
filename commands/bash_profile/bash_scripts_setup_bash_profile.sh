bash_scripts_setup_bash_profile() {
	local BASH_SCRIPTS_ADMIN_INDEX_PATH="$(bash_scripts_admin_root_path)/index.sh"
	local BASH_SCRIPTS_INDEX_PATH="$(bash_scripts_root_path)/index.sh"

	# If '"${BASH_PROFILE_PATH}"' is an empty string then
	if [ -z "${BASH_PROFILE_PATH}" ]; then
		local BASH_PROFILE_PATH="${HOME}/.bash_profile"
	fi

	##
	# Creates .bash_profile if it does not exist.
	#
	if [ ! -f "${BASH_PROFILE_PATH}" ]; then
		touch "${BASH_PROFILE_PATH}"
	fi

	##
	# Adds importing of 'bash_scripts_admin' to the '.bash_profile' if it is NOT already added.
	#
	grep --quiet "${BASH_SCRIPTS_ADMIN_INDEX_PATH}" "${BASH_PROFILE_PATH}" || (
		tee -a "${BASH_PROFILE_PATH}" <<-BASH > /dev/null
			[ -f "${BASH_SCRIPTS_ADMIN_INDEX_PATH}" ] && . "${BASH_SCRIPTS_ADMIN_INDEX_PATH}" # Automatically added by "bash_scripts_admin".
		BASH
	)

	##
	# Adds importing of 'bash_scripts' to the '.bash_profile' if it is NOT already added.
	#
	grep --quiet "${BASH_SCRIPTS_INDEX_PATH}" "${BASH_PROFILE_PATH}" || (
		tee -a "${BASH_PROFILE_PATH}" <<-BASH > /dev/null
			[ -f "${BASH_SCRIPTS_INDEX_PATH}" ] && . "${BASH_SCRIPTS_INDEX_PATH}" # Automatically added by "bash_scripts_admin".
		BASH
	)
}
