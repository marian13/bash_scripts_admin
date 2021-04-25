bash-scripts-remove-directive() {
	local SUBPROJECT=$1
	local TYPE=$2
	local DIRECTIVE_NAME=$3
	local CODE=$4

	local INDEX_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/${TYPE}s/index.sh"
	local DIRECTIVE_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/${TYPE}s/${DIRECTIVE_NAME}.sh"

	##
	# Checks whether a file exist.
	# https://stackoverflow.com/a/638980/12201472
	#
	if [ ! -f "${DIRECTIVE_PATH}" ]; then
		return
	fi

	##
	# Removes importing of the directive file from the corresponding index file.
	# For details of 'echo' and 'grep' combination see https://stackoverflow.com/a/30822660/12201472
	# For '-n' docs see https://ss64.com/osx/echo.html
	#
	echo -n "$(grep --invert-match --extended-regexp "${DIRECTIVE_PATH}" "${INDEX_PATH}")" > "${INDEX_PATH}"

	##
	# Removes the directive file.
	#
	rm "${DIRECTIVE_PATH}"
}
