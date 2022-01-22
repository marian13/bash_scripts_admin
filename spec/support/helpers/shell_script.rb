# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    class ShellScript
      attr_reader :text

      def initialize(text) = @text = text

      ##
      # Invokes a shell text.
      #
      # Uses Open3.popen3 under the hood.
      # https://docs.ruby-lang.org/en/3.1/Open3.html#method-c-popen3
      # @return [ShellScript]
      #
      def invoke(with: :bash, &block)
        dialect = with
        text_with_runner = prepend_runner(text, dialect)

        ::Open3.popen3(text_with_runner) do |stdin, stdout, stderr, wait_thr|
          self.exit_status = wait_thr.value.exitstatus
          self.stdout = stdout.read.chomp
          self.stderr = stderr.read.chomp

          block.call(self) if block
        end

        self
      end

      attr_accessor :exit_status, :stdin, :stdout, :stderr

      private

      def prepend_runner(text, dialect)
        if dialect == :sh
          "sh -c \"#{text}\""
        elsif dialect == :bash
          "bash -c \"#{text}\""
        else
          raise
        end
      end
    end

    def shell_script(text, &block) = ShellScript.new(text).tap { _1.invoke(&block) if block }
  end

  config.include mod
end

puts "RSpec: shell_script helper loaded."
