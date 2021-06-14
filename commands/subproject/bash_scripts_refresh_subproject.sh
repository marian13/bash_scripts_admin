bash_scripts_refresh_subproject() {
	local SUBPROJECT=$1

	local PROJECT_INDEX_PATH="$(bash_scripts_root_path)/index.sh"
	local SUBPROJECT_INDEX_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/index.sh"
	local SUBPROJECT_COMMANDS_INDEX_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/commands/index.sh"
	local SUBPROJECT_EFFECTS_INDEX_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/effects/index.sh"

	local SUBPROJECT_COMMANDS_FOLDER_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/commands"
	local SUBPROJECT_EFFECTS_FOLDER_PATH="$(bash_scripts_root_path)/${SUBPROJECT}/effects"

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
			. "${SUBPROJECT_INDEX_PATH}"
		BASH
	)

	##
	# Imports commands and effects to subproject if they are NOT already imported.
	#
	grep --quiet "${SUBPROJECT_COMMANDS_INDEX_FULL_NAME}" "${SUBPROJECT_INDEX_PATH}" || (
		tee "${SUBPROJECT_INDEX_PATH}" <<-BASH > /dev/null
			# This is an auto-generated file.
			# Please, do NOT modify it directly, use "bash_scripts" commands instead.
			# To see a list of available commands, execute the following in your terminal:
			#
			# $ bash_scripts_help
			#
			. "${SUBPROJECT_COMMANDS_INDEX_PATH}"
			. "${SUBPROJECT_EFFECTS_INDEX_PATH}"
		BASH
	)
}
