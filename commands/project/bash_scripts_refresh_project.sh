bash-scripts-refresh-project() {
	##
	# Creates the 'bash_scripts' project folder if it is not already exist.
	#
	mkdir -p "$(bash-scripts-root-path)"

	##
	# Creates the 'bash_scripts' project index file with the default text if it is not already exist.
	# For '--quiet' and '--no-messages' docs see https://ss64.com/osx/grep.html
	#
	grep --quiet --no-messages "This is an auto-generated file." "$(bash-scripts-root-path)/index.sh" || (
		tee "$(bash-scripts-root-path)/index.sh" <<-BASH > /dev/null
			# This is an auto-generated file.
			# Please, do NOT modify it directly, use "bash-scripts" commands instead.
			# To see a list of available commands, execute the following in your terminal:
			#
			# $ bash-scripts-help
			#
		BASH
	)

	bash-scripts-setup-bash-profile
}
