def whyrun_supported?
  # rely on the whyrun support of the resources
  true
end

def build_ohai_hint_path
  ::File.join(node[:ohai][:hints_path], "#{new_resource.name}.json")
end

use_inline_resources

action :create do
  updated = false

  r = directory node[:ohai][:hints_path] do
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
