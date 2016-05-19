Ohai.plugin(:Tester) do
  provides 'tester'

  collect_data do
    tester Mash.new
  end
end
