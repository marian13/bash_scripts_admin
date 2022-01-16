# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    class ShellCommand
      attr_reader :command

      def initialize(command) = @command = command

      ##
      # Invokes a shell command.
      #
      # Uses Open3.popen3 under the hood.
      # https://docs.ruby-lang.org/en/3.1/Open3.html#method-c-popen3
      # @return [ShellCommand]
      #
      def invoke(&block)
        Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
          self.exit_status = wait_thr.value.exitstatus
          self.stdout = stdout.read.chomp
          self.stderr = stderr.read.chomp

          block.call(self)
        end

        self
      end

      attr_accessor :exit_status, :stdin, :stdout, :stderr
    end

    def shell_command(command, &block) = ShellCommand.new(command).tap { _1.invoke(&block) if block }
  end

  config.include mod
end

puts "RSpec: shell_command helper loaded."

