# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def shell_script(text, &block) = ShellScript.create(text).tap { _1.invoke(&block) if block }
  end

  config.include mod
end

puts "RSpec: shell_script helper loaded."
