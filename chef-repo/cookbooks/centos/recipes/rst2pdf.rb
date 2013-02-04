include_recipe "centos::setuptools-0.6c11-2.6"

execute "install rst2pdf" do
  user "root"
  command "easy_install-2.6 rst2pdf"
  creates "/usr/bin/rst2pdf"
end

include_recipe "centos::VL-Gothic-font-20091202"

include_recipe "centos::IPAex-font-00201"
