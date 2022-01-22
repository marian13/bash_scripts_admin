require "open3"
require "tempfile"

RSpec.describe "bash-scripts-admin" do
  describe "root-path" do
    it "returns path of bash_scripts_admin directory" do
      shell_script("#{bash_scripts_admin} root-path") do |result|
        expect(result.exit_status).to eq(0)
        expect(result.stderr).to be_empty
        expect(result.stdout).to eq("/app")
      end

      expect(env_variable("SETUP_ARGS")).not_to exist
      expect(env_variable("MAIN_ARGS")).not_to exist
      expect(shell_function("resolve_root_folder_path")).not_to exist
      expect(shell_function("load_command")).not_to exist
      expect(shell_function("run_entry")).not_to exist

      expect(shell_function("bash_scripts_admin_root_path")).not_to exist
    end
  end
end
