# If a default editor is set then opens 'bash-scripts-admin' in the default editor.
# Otherwise tries to open it in VSCode, vim or vi.
# Does nothing if none of them is installed.
bash-scripts-admin-open-editor() {
  if [ -z "${EDITOR}" ]; then
    local EDITOR="$(which code)" || "$(which vim)" || "$(which vi)"
  fi

  if [ ! -z "${EDITOR}" ]; then
    # NOTE: '$(...)'' is not used here intentionally.
    "${EDITOR}" $(bash-scripts-admin-root-path)
  fi
}
