bash_scripts_load_provision() {
	local BASH_SCRIPTS_PROVISION_PATH=$1

	. "${BASH_SCRIPTS_PROVISION_PATH}"
}

# NOTE: Does not work when file name contains whitespace
# DOCS: Loop a folder recursively https://stackoverflow.com/a/9612232/12201472
bash_scripts_load_provision() {
	local BASH_SCRIPTS_PROVISION_FOLDER=$1
	local FILE=""

	local FILES="$(find "${BASH_SCRIPTS_PROVISION_FOLDER}" -name "*.sh")"

	for FILE in ${FILES}; do
		echo "Imported from: ${FILE}"

		. ${FILE}
	done
}
