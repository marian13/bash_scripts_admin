# If a default editor is set then opens 'bash_scripts' in the default editor.
# Otherwise tries to open it in VSCode, vim or vi.
# Does nothing if none of them is installed.
bash_scripts_open_editor() {
	if [ -z "${EDITOR}" ]; then
		local EDITOR="$(which code)" || "$(which vim)" || "$(which vi)"
	fi

	if [ ! -z "${EDITOR}" ]; then
		# NOTE: '$(...)' is not used here intentionally.
		"${EDITOR}" $(bash_scripts_root_path)
	fi
}
