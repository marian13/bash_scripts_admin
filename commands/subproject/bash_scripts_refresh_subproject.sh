bash-scripts-refresh-subproject() {
	local SUBPROJECT=$1

	local PROJECT_INDEX_PATH="$(bash-scripts-root-path)/index.sh"
	local SUBPROJECT_INDEX_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/index.sh"
	local SUBPROJECT_COMMANDS_INDEX_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/commands/index.sh"
	local SUBPROJECT_EFFECTS_INDEX_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/effects/index.sh"

	local SUBPROJECT_COMMANDS_FOLDER_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/commands"
	local SUBPROJECT_EFFECTS_FOLDER_PATH="$(bash-scripts-root-path)/${SUBPROJECT}/effects"

	local SUBPROJECT_INDEX_FULL_NAME="${SUBPROJECT}/index"
	local SUBPROJECT_COMMANDS_INDEX_FULL_NAME="${SUBPROJECT}/commands/index"

	mkdir -p "${SUBPROJECT_COMMANDS_FOLDER_PATH}"
	mkdir -p "${SUBPROJECT_EFFECTS_FOLDER_PATH}"
	touch "${SUBPROJECT_COMMANDS_INDEX_PATH}"
	touch "${SUBPROJECT_EFFECTS_INDEX_PATH}"
	touch "${SUBPROJECT_INDEX_PATH}"

	##
	# Imports subproject to 'bash_scripts' if it is NOT already imported.
	# For '-a' docs see https://ss64.com/osx/tee.html
  # NOTE: The minus sign from '<<-' HEREDOC removes only leading tabs!!!
  #
	grep --quiet "${SUBPROJECT_INDEX_FULL_NAME}" "${PROJECT_INDEX_PATH}" || (
		tee -a "${PROJECT_INDEX_PATH}" <<-BASH > /dev/null
			source "${SUBPROJECT_INDEX_PATH}"
		BASH
	)

	##
	# Imports commands and effects to subproject if they are NOT already imported.
	#
	grep --quiet "${SUBPROJECT_COMMANDS_INDEX_FULL_NAME}" "${SUBPROJECT_INDEX_PATH}" || (
		tee "${SUBPROJECT_INDEX_PATH}" <<-BASH > /dev/null
			# This is an auto-generated file.
			# Please, do NOT modify it directly, use "bash-scripts" commands instead.
			# To see a list of available commands, execute the following in your terminal:
			#
			# $ bash-scripts-help
			#
			source "${SUBPROJECT_COMMANDS_INDEX_PATH}"
			source "${SUBPROJECT_EFFECTS_INDEX_PATH}"
		BASH
	)
}
