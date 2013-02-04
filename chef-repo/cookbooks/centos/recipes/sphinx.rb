include_recipe "centos::pip-2.6"

execute "install sphinx" do
  user "root"
  command "pip-2.6 install sphinx"
  creates "/usr/bin/sphinx-build"
end

include_recipe "centos::rst2pdf"
