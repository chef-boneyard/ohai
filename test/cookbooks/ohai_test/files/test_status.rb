Ohai.plugin(:TestStatus) do
  provides 'test_status'

  collect_data do
    test_status Mash.new
    test_status['status'] = ::File.read('/status')
  end
end
