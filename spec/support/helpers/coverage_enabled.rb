# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def coverage_enabled? = ENV["COVERAGE"] == "true"
  end

  config.include mod
end

puts "RSpec: coverage_enabled? helper loaded."
