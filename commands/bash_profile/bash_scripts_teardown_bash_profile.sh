bash-scripts-teardown-bash-profile() {
	local BASH_SCRIPTS_ADMIN_INDEX_PATH="$(bash-scripts-admin-root-path)/index.sh"
  local BASH_SCRIPTS_INDEX_PATH="$(bash-scripts-root-path)/index.sh"

  if [[ -z "${BASH_PROFILE_PATH}" ]]; then
		local BASH_PROFILE_PATH="${HOME}/.bash_profile"
	fi

	##
	# Removes importing of 'bash-scripts-admin' from the '.bash_profile'.
	#
	echo -n "$(grep --invert-match --no-messages --extended-regexp "${BASH_SCRIPTS_ADMIN_INDEX_PATH}" "${BASH_PROFILE_PATH}")" > "${BASH_PROFILE_PATH}"

  ##
	# Removes importing of 'bash-scripts' from the '.bash_profile'.
	#
	echo -n "$(grep --invert-match --no-messages --extended-regexp "${BASH_SCRIPTS_INDEX_PATH}" "${BASH_PROFILE_PATH}")" > "${BASH_PROFILE_PATH}"
}
