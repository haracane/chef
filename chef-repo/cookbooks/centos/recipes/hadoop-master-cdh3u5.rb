include_recipe "centos::yum-repos-cloudera-cdh3u5"

execute "yum install hadoop-0.20-namenode hadoop-0.20-secondarynamenode hadoop-0.20-jobtracker" do
  user "root"
  command "yum --enablerepo=cloudera-cdh3u5 -y install hadoop-0.20-namenode hadoop-0.20-secondarynamenode hadoop-0.20-jobtracker"
end

service "hadoop-0.20-namenode" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

service "hadoop-0.20-secondarynamenode" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

service "hadoop-0.20-jobtracker" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
