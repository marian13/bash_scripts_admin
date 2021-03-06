# frozen_string_literal: true

class EnvVariable
  attr_reader :name

  def initialize(name) = @name = name

  class << self
    def create(value, **kwargs) = new(value, **kwargs)
  end

  ##
  # Checks whether an env variable exists (whether it is set).
  #
  # NOTE: If env variable value is empty string then it exists.
  # https://tldp.org/LDP/abs/html/parameter-substitution.html
  # https://stackoverflow.com/a/39296723/12201472
  #
  def exist? = ShellScript.create("echo ${#{name}-default}").invoke.stdout != "default"

  def value = ShellScript.create("echo ${#{name}}").invoke.stdout
end
