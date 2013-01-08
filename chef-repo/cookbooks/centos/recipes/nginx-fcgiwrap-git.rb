include_recipe "centos::nginx"

include_recipe "centos::fcgiwrap"

[
  "etc/nginx/conf.d/default/git.conf",
  "etc/nginx/conf.d/ssl/git.conf"
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
