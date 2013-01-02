include_recipe "centos::yum-repos-jenkins"

execute "yum install jenkins" do
  user "root"
  command "yum --enablerepo=jenkins -y install jenkins"
end

[
  "var/lib/jenkins/.bashrc",
  "var/lib/jenkins/.bash_profile"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "jenkins"
    group "jenkins"
    mode  "0644"
  end
end

[
  "/var/lib/jenkins/bin"
  ].each do |dirpath|
  directory dirpath do
    owner "root"
    group "root"
    mode  "0755"
    action :create
  end
end

[
  "var/lib/jenkins/bin/bash-login"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "jenkins"
    group "jenkins"
    mode  "0755"
  end
end

service "jenkins" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end

