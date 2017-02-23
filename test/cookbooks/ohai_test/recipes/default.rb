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
