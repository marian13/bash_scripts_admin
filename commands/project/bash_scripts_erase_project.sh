bash_scripts_erase_project() {
	rm -rf "$(bash_scripts_root_path)"

	bash_scripts_teardown_bash_profile
}
