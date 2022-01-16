# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def bash_scripts_admin = @bash_scripts_admin ||= "#{application_root}/entry"
  end

  config.include mod
end

puts "RSpec: application_root helper loaded."