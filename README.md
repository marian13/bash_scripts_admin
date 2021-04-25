# bash-scripts-admin

A tool which manages bash scripts.

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
- [rm](https://ss64.com/bash/rm.html) -rf
- [source](https://ss64.com/osx/source.html)
- [tee](https://ss64.com/osx/tee.html) -a
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
- An auto-generated frontmatter placeholder where additional options can be specified, such as which function should be unset when a directive is removed.
