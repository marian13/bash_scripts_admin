# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def shell_function(name) = ShellFunction.create(name)
  end

  config.include mod
end

puts "RSpec: shell_function helper loaded."

