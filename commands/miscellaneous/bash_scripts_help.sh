bash_scripts_help() {
	# NOTE: Be careful with tabs and spaces!
	cat <<-'TEXT'
		--- --- --- --- ---

		bash_scripts_add_directive <subproject> <directive_type> <directive_name> <directive_code>

		  Adds a new directive to 'bash_scripts' subproject.
		  If subproject does NOT already exist, it will automatically created.
		  <directive_type> can be either 'command' or 'effect'.

		  Example:

		    bash_scripts_add_directive "git" "effect" "display_git_branch" <<-'BASH'
		      ##
		      # Extracts current git branch name for current directory if current directory is managed by git.
		      # See https://gist.github.com/ankurk91/2efe14650d54d7d09528cea3ed432f6d for details.
		      #
		      parse_git_branch() {
		        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
		      }

		      ##
		      # Tells terminal to show current git branch name in the text that comes before `$`.
		      #
		      export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
		    BASH

		--- --- --- --- ---

		bash_scripts_erase_project

		  Erases 'bash_scripts' project completely.
			Use 'bash_scripts_refresh_project' to recreate it.

		--- --- --- --- ---

		bash_scripts_help

		  Prints this reference.

		--- --- --- --- ---

		bash_scripts_refresh_project

		  Recreates 'bash_scripts' folders if they do NOT already exist.

		--- --- --- --- ---

		bash_scripts_remove_directive <subproject> <directive_type> <directive_name>

		  Removes a directive from 'bash_scripts' subproject.
		  If directive does NOT already exist, it does nothing.
		  <directive_type> can be either 'command' or 'effect'.

		  Example:

		    bash_scripts_remove_directive "git" "effect" "display_git_branch"

		--- --- --- --- ---
	TEXT
}
