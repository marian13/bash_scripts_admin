# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    class EnvVariable
      attr_reader :name

      def initialize(name) = @name = name

      ##
      # Checks whether an env variable exists (whether it is set).
      #
      # NOTE: If env variable value is empty string then it exists.
      # https://tldp.org/LDP/abs/html/parameter-substitution.html
      # https://stackoverflow.com/a/39296723/12201472
      #
      def exist? = ShellScript.new("echo ${#{name}-default}").invoke.stdout != "default"

      def value = ShellScript.new("echo ${#{name}}").invoke.stdout
    end

    def env_variable(name) = EnvVariable.new(name)
  end

  config.include mod
end

puts "RSpec: env_variable helper loaded."

