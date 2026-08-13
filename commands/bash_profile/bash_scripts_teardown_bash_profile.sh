bash_scripts_teardown_bash_profile() {
	local BASH_SCRIPTS_ADMIN_INDEX_PATH="$(bash_scripts_admin_root_path)/index.sh"
	local BASH_SCRIPTS_INDEX_PATH="$(bash_scripts_root_path)/index.sh"

	local BASH_SCRIPTS_ADMIN_INDEX_PATH_WITH_HOME="\${HOME}${BASH_SCRIPTS_ADMIN_INDEX_PATH#"${HOME}"}"
	local BASH_SCRIPTS_INDEX_PATH_WITH_HOME="\${HOME}${BASH_SCRIPTS_INDEX_PATH#"${HOME}"}"

	if [ -z "${BASH_PROFILE_PATH}" ]; then
		local BASH_PROFILE_PATH="${HOME}/.bash_profile"
	fi

	##
	# Removes importing of 'bash_scripts_admin' from the '.bash_profile'.
	#
	# NOTE: Uses "command grep" (not "grep") since some shells alias/shadow "grep"
	# (e.g. Claude Code's shell integration), which can behave differently for this pattern.
	#
	echo -n "$(command grep --invert-match --no-messages --extended-regexp "${BASH_SCRIPTS_ADMIN_INDEX_PATH_WITH_HOME}" "${BASH_PROFILE_PATH}")" > "${BASH_PROFILE_PATH}"

	##
	# Removes importing of 'bash_scripts' from the '.bash_profile'.
	#
	echo -n "$(command grep --invert-match --no-messages --extended-regexp "${BASH_SCRIPTS_INDEX_PATH_WITH_HOME}" "${BASH_PROFILE_PATH}")" > "${BASH_PROFILE_PATH}"
}
