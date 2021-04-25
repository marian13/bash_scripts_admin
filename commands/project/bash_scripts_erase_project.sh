bash-scripts-erase-project() {
	rm -rf "$(bash-scripts-root-path)"

	bash-scripts-teardown-bash-profile
}
