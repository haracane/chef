include_recipe "centos::setuptools-0.6c11"

execute "install pip" do
  user "root"
  command "easy_install pip"
  creates "/usr/bin/pip"
end
