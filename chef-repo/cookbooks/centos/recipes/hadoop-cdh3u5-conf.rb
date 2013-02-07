

directory "/var/lib/hadoop-0.20" do
  owner "root"
  group "root"
  recursive true
  mode 0755
end

directory "/var/lib/hadoop-0.20/cache" do
  owner "root"
  group "root"
  recursive true
  mode 0777
end

directory "/var/lib/hadoop-0.20/cache/hdfs/dfs" do
  owner "hdfs"
  group "hadoop"
  recursive true
  mode 0755
end

directory "/var/lib/hadoop-0.20/cache/mapred/mapred" do
  owner "mapred"
  group "hadoop"
  recursive true
  mode 0755
end

[
  "usr/lib/hadoop/conf/masters",
  "usr/lib/hadoop/conf/slaves",
  "usr/lib/hadoop/conf/hadoop-env.sh",
  "usr/lib/hadoop/conf/core-site.xml", 
  "usr/lib/hadoop/conf/hdfs-site.xml", 
  "usr/lib/hadoop/conf/mapred-site.xml"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
    variables(node[:variables])
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
