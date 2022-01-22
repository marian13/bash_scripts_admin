# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    def bash_scripts_admin
      @bash_scripts_admin ||=
        begin
          if coverage_enabled?
            "bashcov -- #{application_root}/index.sh"
          else
            "#{application_root}/index.sh"
          end
        end
    end
  end

  config.include mod
end

puts "RSpec: bash_scripts_admin helper loaded."
