def whyrun_supported?
  # rely on the whyrun support of the resources
  true
end

def build_ohai_hint_path
  ::File.join(node['ohai']['hints_path'], "#{new_resource.name}.json")
end

use_inline_resources

action :create do
  r = directory node['ohai']['hints_path'] do
    action :create
    recursive true
  end

  updated = r.updated_by_last_action?

  r = file build_ohai_hint_path do
    action :create
    content JSON.pretty_generate(new_resource.content)
  end

  updated = updated or r.updated_by_last_action?
  new_resource.updated_by_last_action(updated)
end

def load_current_resource
  @current_resource = Chef::Resource::OhaiHint.new(new_resource.name)
  if ::File.exist?(build_ohai_hint_path)
    begin
      @current_resource.content(JSON.parse(::File.read(build_ohai_hint_path)))
    rescue JSON::ParserError
      @current_resource.content(nil)
    end
  else
    @current_resource.content(nil)
  end

  @current_resource
end
