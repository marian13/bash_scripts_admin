bash_scripts_add_directive() {
	local SUBPROJECT=$1
	local TYPE=$2
	local DIRECTIVE_NAME=$3
	local CODE=$4

	local INDEX_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/${TYPE}s/index.sh"
	local DIRECTIVE_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/${TYPE}s/${DIRECTIVE_NAME}.sh"

	if [ -z "${EVAL}" ]; then
		local EVAL="true"
	fi

	if [ -z "${OVERRIDE}" ]; then
		local OVERRIDE="true"
	fi

	bash_scripts_refresh_subproject "${SUBPROJECT}"

	##
	# Adds importing of the directive file to the corresponding index file.
	#
	grep --quiet "${DIRECTIVE_PATH}" "${INDEX_PATH}" || (
		tee -a "${INDEX_PATH}" <<-BASH > /dev/null
			. "${DIRECTIVE_PATH}"
		BASH
	)

	##
	# Creates a file for the directive with its code.
	# Overwrites the directive file if it already exists.
	# NOTE: '${CODE}' is NOT wrapped by quotes intentionally to avoid string substitution.
	#
	if [ "${OVERRIDE}" == "true" ]; then
		tee "${DIRECTIVE_PATH}" ${CODE} > /dev/null
	fi

	##
	# Evaluates the directive code immediately after adding it.
	#
	if [ "${OVERRIDE}" == "true" ] && [ "${EVAL}" == "true" ]; then
		eval ${CODE}
	fi
}
