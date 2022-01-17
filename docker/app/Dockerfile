FROM ruby:3.1

##
# Creates /app directory.
#
RUN mkdir -p /app

##
# Copies all project content from host to the newly created /app folder in the container.
#
COPY . /app

##
# Sets /app as a workdir.
# All the following commands are executed from it.
#
WORKDIR /app

##
# Installs Ruby gems like rspec and bashcov.
#
RUN bundle install

##
# Installs vim (https://www.vim.org/).
#
# NOTE: It fails to install without apt-get update.
#
RUN apt-get update -qq && apt-get install --no-install-recommends -y vim

##
# Creates a new user for bashcov.
# https://www.thegeekdiary.com/run-docker-as-a-non-root-user/
#
# Why it is needed? Why not root as always?
# - bashcov depend on PS4 variable.
# - Starting from bash 4.4 PS4 is NOT inherited by subprocesses when user is root.
# - bashcov uses subprocesses under thhe hood.
# - Docker default user is root.
# - As a result, the following error happens:
#
#   #<Thread:0x00007efd5006faa0 /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/runner.rb:42 run> terminated with exception (report_on_exception is true):
#   /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/xtrace.rb:121:in `parse_hit!': expected integer for LINENO, got "" (Bashcov::XtraceError)
#           from /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/xtrace.rb:96:in `block in read'
#           from /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/xtrace.rb:94:in `loop'
#           from /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/xtrace.rb:94:in `read'
#           from /usr/local/bundle/gems/bashcov-1.8.2/lib/bashcov/runner.rb:42:in `block (2 levels) in run'
#   bashcov: warning: encountered an error parsing Bash's output (error was: expected integer for LINENO, got ""). This can occur if your script or its path contains the sequence "\u001E", or if your script unsets LINENO. Aborting early; coverage report will be incomplete.
#
# Non root users still inherit PS4 when creating a subprocess.
# https://github.com/infertux/bashcov/issues/31#issuecomment-388027461
# https://github.com/javanile/bashcov/blob/master/Dockerfile#L5
#
# NOTE: 8888 is unique user id. It is also used in the docker-compose.
#
RUN useradd -u 8888 bashcov

##
# Changes user to bashcov.
# All the following commands are executed as bashcov.
#
USER bashcov

##
# Sets PS4 for bashcov.
# https://github.com/javanile/bashcov/blob/master/Dockerfile#L6
#
ENV PS4="+%N:%i>"
