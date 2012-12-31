include_recipe "centos::yum-repos-cloudera-cdh3"

execute "yum install hadoop-0.20 hadoop-hive hadoop-pig" do
  user "root"
  command "yum --enablerepo=cloudera-cdh3 -y install hadoop-0.20 hadoop-hive hadoop-pig"
end
