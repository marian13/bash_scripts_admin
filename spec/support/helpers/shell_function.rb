# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    class ShellFunction
      attr_reader :name

      def initialize(name) = @name = name

      ##
      # Checks whether a shell function exists.
      #
      # https://linuxcommand.org/lc3_man_pages/typeh.html
      # https://ss64.com/bash/type.html
      # https://stackoverflow.com/a/85903/12201472
      #
      # @return [Boolean]
      #
      def exist? = ["alias", "keyword", "function", "builtin"].include?(`type -t #{name}`)

      ##
      # Invokes a shell function.
      #
      # NOTE: Uses Kernel#` under the hood.
      # https://ruby-doc.org/core-3.1.0/Kernel.html#method-i-60
      #
      # @param args [String] shell function arguments as a string.
      # @return [String]
      #
      def invoke(args = nil) = args.to_s.empty? ? `#{name}` : `#{name} #{args}`
    end

    def shell_function(name) = ShellFunction.new(name)
  end

  config.include mod
end

puts "RSpec: shell_function helper loaded."

