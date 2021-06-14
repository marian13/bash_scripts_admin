bash_scripts_refresh_project() {
	##
	# Creates the 'bash_scripts' project folder if it is not already exist.
	#
	mkdir -p "$(bash_scripts_root_path)"

	##
	# Creates the 'bash_scripts' project index file with the default text if it is not already exist.
	# For '--quiet' and '--no-messages' docs see https://ss64.com/osx/grep.html
	#
	grep --quiet --no-messages "This is an auto-generated file." "$(bash_scripts_root_path)/index.sh" || (
		tee "$(bash_scripts_root_path)/index.sh" <<-BASH > /dev/null
			# This is an auto-generated file.
			# Please, do NOT modify it directly, use "bash_scripts" commands instead.
			# To see a list of available commands, execute the following in your terminal:
			#
			# $ bash_scripts_help
			#
		BASH
	)

	bash_scripts_setup_bash_profile
}
