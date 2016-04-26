property :hint_name, kind_of: String, name_attribute: true
property :content, kind_of: Hash
property :compile_time, [true, false], default: true

action_class do
  def ohai_hint_path
    ::File.join(::Ohai::Config[:hints_path].first, name)
  end

  def build_content
    # passing nil to file produces deprecation warnings so pass an empty string
    return nil if content.nil? || content.empty?
    JSON.pretty_generate(content)
  end

  def file_content(path)
    return JSON.parse(::File.read(path))
  rescue JSON::ParserError
    Chef::Log.debug("Could not parse JSON in ohai hint at #{ohai_hint_path}. It's probably an empty hint file")
    return nil
  end
end

action :create do
  directory ::Ohai::Config[:hints_path].first do
    action :create
    recursive true
  end

  file ohai_hint_path do
    action :create
    content build_content
  end
end

# this resource forces itself to run at compile_time
def after_created
  if compile_time
    Array(action).each do |action|
      run_action(action)
    end
  end
end
