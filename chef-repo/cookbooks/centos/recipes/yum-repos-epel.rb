[
  "etc/yum.repos.d/epel.repo",
  "etc/yum.repos.d/epel-testing.repo"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
