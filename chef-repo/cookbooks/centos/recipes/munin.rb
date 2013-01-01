include_recipe "centos::yum-repos-epel"

package "munin" do
  action :install
end

[
  "etc/munin/munin.conf"
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
