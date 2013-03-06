include_recipe "epel::yum-repos-epel"

package "munin-node" do
  action :install
end

[
  "etc/munin/munin-node.conf"
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

service "munin-node" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
