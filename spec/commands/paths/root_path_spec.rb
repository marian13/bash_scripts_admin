# frozen_string_literal: true

require_shared_context "ensure_shared_entities_do_not_exist"

RSpec.describe "bash-scripts-admin" do
  include_context "ensure shared entities do NOT exist"

  describe "root-path" do
    it "returns path of bash_scripts_admin directory" do
      shell_script("#{bash_scripts_admin} root-path") do |result|
        expect(result.exit_status).to eq(0)
        expect(result.stderr).to be_empty
        expect(result.stdout).to eq("/app")
      end

      expect(shell_function("bash_scripts_admin_root_path")).not_to exist
    end
  end
end
