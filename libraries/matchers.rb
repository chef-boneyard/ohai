# encoding: utf-8

if defined?(ChefSpec)
  ChefSpec.define_matcher :ohai_hint

  def create_ohai_hint(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:ohai_hint, :create, resource)
  end

  def delete_ohai_hint(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:ohai_hint, :delete, resource)
  end

  def create_ohai_plugin(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:ohai_plugin, :create, resource)
  end

  def delete_ohai_plugin(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:ohai_plugin, :delete, resource)
  end
end
