Ohai.plugin(:Test) do
  provides 'test'

  collect_data do
    test Mash.new
  end
end
