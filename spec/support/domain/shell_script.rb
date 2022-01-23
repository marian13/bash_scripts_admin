# frozen_string_literal: true

require_relative "shell_script/text"

class ShellScript
  attr_accessor :exit_status, :stdin, :stdout, :stderr

  attr_reader :text

  def initialize(text) = @text = Text.create(text)

  class << self
    def create(value, **kwargs) = new(value, **kwargs)
  end

  ##
  # Invokes a shell text.
  #
  # Uses Open3.popen3 under the hood.
  # https://docs.ruby-lang.org/en/3.1/Open3.html#method-c-popen3
  # @return [ShellScript]
  #
  def invoke(runner: :bash, &block)
    ::Open3.popen3(text.with_runner(runner).to_s) do |stdin, stdout, stderr, wait_thr|
      self.exit_status = wait_thr.value.exitstatus
      self.stdout = stdout.read.chomp
      self.stderr = stderr.read.chomp

      block.call(self) if block
    end

    self
  end
end
