[
  "mod_auth_mysql"
  ].each do |pkg|
  package pkg do
    action :install
  end
end

[
  "/opt/alminium/svn"
  ].each do |dirpath|
  directory dirpath do
    owner "apache"
    group "apache"
    mode  "0755"
    action :create
  end
end


[
  "etc/httpd/conf.d/svn.conf"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
