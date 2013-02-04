execute "yum install python26-devel" do
  user "root"
  command "yum --enablerepo=epel -y install python26-devel"
end
