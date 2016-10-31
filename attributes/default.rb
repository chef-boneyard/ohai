default['ohai']['lsb']['package'] = value_for_platform_family(
  'debian' => 'lsb-release',
  %w(rhel fedora) => 'redhat-lsb'
)
