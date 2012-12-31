include_recipe "centos::yum-repos-cloudera-cdh3u5"

execute "yum install hadoop-0.20-datanode hadoop-0.20-tasktracker" do
  user "root"
  command "yum --enablerepo=cloudera-cdh3u5 -y install hadoop-0.20-datanode hadoop-0.20-tasktracker"
end

service "hadoop-0.20-datanode" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

service "hadoop-0.20-tasktracker" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
