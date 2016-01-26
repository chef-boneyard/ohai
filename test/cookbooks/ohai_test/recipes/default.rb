ohai_hint 'hint_at_compile_time' do
  action :nothing
end.run_action(:create)

ohai_hint 'hint_with_content' do
  content Hash[:a, 'test_content']
end

ohai_hint 'hint_without_content'
