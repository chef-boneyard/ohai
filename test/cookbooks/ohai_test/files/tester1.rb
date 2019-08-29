Ohai.plugin(:Tester1) do
  provides 'tester1'

  collect_data do
    tester1 Mash.new
  end
end
