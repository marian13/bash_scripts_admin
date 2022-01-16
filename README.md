# bash-scripts-admin

A tool that manages bash scripts.

## Installation

Navigate to a folder where you would like to install `bash_scripts_admin` and execute:

```bash
git clone https://github.com/marian13/bash_scripts_admin.git
```

If you are using macOS, additionally run:

```bash
brew install coreutils
```

## Setup

```bash
cd bash_scripts_admin

BASH_PROFILE_PATH=~/.bash_profile . ./index.sh
```

Where `BASH_PROFILE_PATH` is [a path to a file that is automatically loaded](https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment) when you start a new bash session.

For example, it may be [`~/.bash_profile` on macOS](https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc).

## Development

### How to start local dev env?

Copy and run the following command:

```bash
cd ~/Projects/bash_scripts_admin \
  && direnv exec . tmuxinator start bash_scripts_admin
```

**NOTE:** `tmuxinator` is used instead of `mux` since it is not available inside `direnv exec`.

### How to stop local dev env?

Use:

```bash
cd ~/Projects/bash_scripts_admin \
  && tmuxinator stop bash_scripts_admin
```

## Glossary

- Bash profile.
- bash-scripts-admin.
- bash-scripts.
- Command.
- Directive.
- Effect.
- Main entry point.
- Provision.
- Project.
- Root path.
- Subproject.

## Conventions

- Multi-word command and arguments names contain dashes as word separators.
- Multi-word folder and file names contain underscores as word separators.
- Leading tabs instead of spaces (for HEREDOCs).
- Commands and options inside comments are enclosed by single quotes.

## References

A list of links to the docs of bash commands, syntax structures, environment variables, and techniques used inside this project.

### Commands

- [cat](https://ss64.com/osx/cat.html)
- [echo](https://ss64.com/osx/echo.html) -n
- [export](https://ss64.com/osx/export.html)
- [grep](https://ss64.com/osx/grep.html) --quiet --no-messages --extended-regexp
- [local](https://ss64.com/bash/local.html)
- [mkdir](https://ss64.com/osx/mkdir.html) -p
- [return](https://ss64.com/bash/return.html)
- [rm](https://ss64.com/bash/rm.html) -rf
- [source](https://ss64.com/osx/source.html)
- [tee](https://ss64.com/osx/tee.html) -a
- [touch](https://ss64.com/bash/touch.html)
- [which](https://ss64.com/osx/which.html)

### Syntax Structures

- [Command substitution aka $(command)](https://ss64.com/osx/syntax-substitution.html)
- [HEREDOC](https://ss64.com/osx/syntax-here.html)
- [if](https://ss64.com/osx/if.html)
- [Input/output redirection aka >, >>, | and similar](https://ss64.com/osx/syntax-redirection.html)
- [Parentheses aka ()](https://ss64.com/osx/syntax-brackets.html)
- [Quotes aka '', "" and ``](https://ss64.com/bash/syntax-quoting.html)
- [Shell parameter expansion aka ${variable}](https://ss64.com/bash/syntax-expand.html#parameter)
- [Test aka []](https://ss64.com/osx/test.html) -z
- [&& and ||](https://ss64.com/bash/syntax-execute.html)

### Environment Variables

- [EDITOR](https://ss64.com/osx/syntax-env_vars.html)

### Techniques

- [Redirects to /dev/null](https://ss64.com/osx/syntax-redirection.html).


## Future Plans

- A detailed description of how exactly 'bash-scripts-admin' manages bash scripts.
- Implementation of a way how to load and dump provision files.
- Introduction of a new script type - installer (in addition to already existing commands and effects).
- Arguments number checking.
- More docs.
- A frontmatter where additional options can be specified, such as which function should be unset when a directive is removed.
- Specs, for example using [Serverspec](https://serverspec.org/).
- List commands.
