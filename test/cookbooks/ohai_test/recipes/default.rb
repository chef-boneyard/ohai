ohai_hint 'hint_at_compile_time'

ohai_hint 'not_at_compile_time' do
  compile_time false
end

ohai_hint 'hint_with_content' do
  content Hash[:a, 'test_content']
end

ohai_hint 'hint_without_content'

ohai_plugin 'test'

ohai_plugin 'another_test' do
  source_file 'another_test_source_file.rb'
end
