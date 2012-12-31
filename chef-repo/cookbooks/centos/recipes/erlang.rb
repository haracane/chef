include_recipe "centos::yum-repos-epel-erlang"

execute "yum install erlang" do
  user "root"
  command "yum --enablerepo=epel-erlang -y install erlang"
end
