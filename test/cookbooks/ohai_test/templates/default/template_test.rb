Ohai.plugin(:Templatetest) do
  provides '<%= @plugin_name -%>'

  collect_data do
    template_test Mash.new
  end
end
