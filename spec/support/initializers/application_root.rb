# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def application_root
      @application_root ||= ::File.expand_path("../..", __dir__)
    end
  end

  config.include mod
end

puts "RSpec: application_root initialier loaded."
