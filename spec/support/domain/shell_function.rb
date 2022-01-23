# frozen_string_literal: true

class ShellFunction
  attr_reader :name

  def initialize(name) = @name = name

  class << self
    def create(value, **kwargs) = new(value, **kwargs)
  end

  ##
  # Checks whether a shell function exists.
  #
  # https://linuxcommand.org/lc3_man_pages/typeh.html
  # https://ss64.com/bash/type.html
  # https://stackoverflow.com/a/85903/12201472
  # https://linuxcommand.org/lc3_man_pages/typeh.html
  #
  # @return [Boolean]
  #
  def exist? = !not_exist?

  def not_exist? = ShellScript.create("type -t #{name}").invoke.stdout.empty?

  ##
  # Invokes a shell function.
  #
  # NOTE: Uses Kernel#` under the hood.
  # https://ruby-doc.org/core-3.1.0/Kernel.html#method-i-60
  #
  # @param args [String] shell function arguments as a string.
  # @return [ShellScript]
  #
  def invoke(args = nil) = ShellScript.create("#{name} #{args}".rstrip).invoke
end
