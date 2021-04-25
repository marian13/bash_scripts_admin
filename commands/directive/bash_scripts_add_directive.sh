bash-scripts-add-directive() {
	local SUBPROJECT=$1
	local TYPE=$2
	local DIRECTIVE_NAME=$3
	local CODE=$4

	local INDEX_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/${TYPE}s/index.sh"
	local DIRECTIVE_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/${TYPE}s/${DIRECTIVE_NAME}.sh"

	bash-scripts-refresh-subproject "${SUBPROJECT}"

	##
	# Adds importing of the directive file to the corresponding index file.
	#
	grep --quiet "${DIRECTIVE_PATH}" "${INDEX_PATH}" || (
		tee -a "${INDEX_PATH}" <<-BASH > /dev/null
			source "${DIRECTIVE_PATH}"
		BASH
	)

	##
	# Creates a file for the directive with its code.
  # Overwrites the directive file if it already exists.
	# NOTE: '${CODE}' is NOT wrapped by quotes intentionally to avoid string substitution.
	#
	tee "${DIRECTIVE_PATH}" ${CODE} > /dev/null
}
