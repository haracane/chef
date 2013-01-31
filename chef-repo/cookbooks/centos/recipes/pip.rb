include_recipe "centos::setuptools-0.6c11"

package "python-devel" do
  action :install
end

execute "install pip" do
  user "root"
  command "easy_install pip"
  creates "/usr/bin/pip"
end
