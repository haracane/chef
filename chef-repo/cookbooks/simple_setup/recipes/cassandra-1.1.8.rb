
execute "download apache-cassandra-1.1.8-bin.tar.gz" do
  user "root"
  cwd "/root/src"
  command "curl -L -O http://ftp.riken.jp/net/apache/cassandra/1.1.8/apache-cassandra-1.1.8-bin.tar.gz"
  creates "/root/src/apache-cassandra-1.1.8-bin.tar.gz"
end

execute "tar zxf apache-cassandra-1.1.8-bin.tar.gz" do
  user "root"
  cwd "/root/src"
  command "tar zxf apache-cassandra-1.1.8-bin.tar.gz"
  creates "/root/src/apache-cassandra-1.1.8"
end

execute "cp -r apache-cassandra-1.1.8-bin /usr/lib/cassandra118" do
  user "root"
  command "cp -r /root/src/apache-cassandra-1.1.8 /usr/lib/cassandra118"
  creates "/usr/lib/cassandra118"
end

link "/usr/lib/cassandra" do
  to "/usr/lib/cassandra118"
end

["cassandra.yaml"].each do |filename|
  filepath = "usr/lib/cassandra118/conf/#{filename}"
  template "/#{filepath}" do
    source "#{filepath}.erb"
    owner "root"
    mode 0644
  end
end
