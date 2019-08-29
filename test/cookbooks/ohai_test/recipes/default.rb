ohai_hint 'hint_at_compile_time'

ohai_hint 'not_at_compile_time' do
  compile_time false
end

ohai_hint 'hint_with_content' do
  content Hash[:a, 'test_content']
end

ohai_hint 'hint_without_content'

ohai_hint 'hint_with_json_in_resource_name.json'

ohai_plugin 'create tester' do
  plugin_name 'tester'
end

ohai_plugin 'another_test' do
  source_file 'another_test_source_file.rb'
  cookbook 'ohai_test'
end

ohai_plugin 'template_test' do
  resource :template
  variables(plugin_name: 'template_test')
end

# node['test'] comes from the ohai plugin
file '/expected_file' do
  action :create
  only_if { node['tester'] }
end

ohai_plugin 'tester' do
  action :delete
end

file 'Initial status file' do
  path '/status'
  content 'Initial'
end.run_action(:create)

ohai_plugin 'load test_status' do
  plugin_name 'test_status'
end

ruby_block 'save loaded status' do
  block do
    ::File.write('/status', node['test_status'].inspect)
  end
end.run_action(:run)

file 'Next status' do
  path '/status'
  content 'Second'
end.run_action(:create)

ohai_plugin 'Tester and reload all plugins' do
  plugin_name 'tester'
end

ruby_block 'save loaded status second time' do
  block do
    ::File.write('/status2', node['test_status'].inspect)
  end
end.run_action(:run)

file 'Third status' do
  path '/status'
  content 'Updated by tester1 load'
end.run_action(:create)

ohai_plugin 'Install Tester1 and load only tester1' do
  plugin_name 'tester1'
  load_single_plugin true
end

ruby_block 'save loaded status third time' do
  block do
    ::File.write('/status3', node['test_status'].inspect)
  end
end.run_action(:run)
