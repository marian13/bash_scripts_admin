RSpec.shared_context "ensure shared entities do NOT exist" do
  after do
    expect(env_variable("SETUP_ARGS")).not_to exist
    expect(env_variable("MAIN_ARGS")).not_to exist
    expect(shell_function("resolve_root_folder_path")).not_to exist
    expect(shell_function("load_command")).not_to exist
    expect(shell_function("run_entry")).not_to exist
  end
end
