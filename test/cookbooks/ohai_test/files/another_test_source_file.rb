Ohai.plugin(:Anothertest) do
  provides 'another_test'

  collect_data do
    another_test Mash.new
  end
end
