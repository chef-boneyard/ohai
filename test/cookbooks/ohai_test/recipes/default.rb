ohai_hint 'hint_at_compile_time'

ohai_hint 'not_at_compile_time' do
  compile_time false
end

ohai_hint 'hint_with_content' do
  content Hash[:a, 'test_content']
end

ohai_hint 'hint_without_content'
