# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def env_variable(name) = EnvVariable.create(name)
  end

  config.include mod
end

puts "RSpec: env_variable helper loaded."

