
bash-scripts-help() {
	# NOTE: Be careful with tabs and spaces!
	cat <<-'TEXT'
		--- --- --- --- ---

		bash-scripts-add-directive <subproject> <directive-type> <directive-name> <directive-code>

		  Adds a new directive to 'bash-scripts' subproject.
		  If subproject does NOT already exist, it will automatically created.
		  <directive-type> can be either 'command' or 'effect'.

		  Example:

		    bash-scripts-add-directive "git" "effect" "display-git-branch" <<-'BASH'
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

		bash-scripts-erase-project

		  Erases 'bash-scripts' project completely.
			Use 'bash-scripts-refresh-project' to recreate it.

		--- --- --- --- ---

		bash-scripts-help

		  Prints this reference.

		--- --- --- --- ---

		bash-scripts-refresh-project

		  Recreates 'bash-scripts' folders if they do NOT already exist.

		--- --- --- --- ---

		bash-scripts-remove-directive <subproject> <directive-type> <directive-name>

		  Removes a directive from 'bash-scripts' subproject.
		  If directive does NOT already exist, it does nothing.
		  <directive-type> can be either 'command' or 'effect'.

		  Example:

		    bash-scripts-remove-directive "git" "effect" "display-git-branch"

		--- --- --- --- ---
	TEXT
}
