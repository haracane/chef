include_recipe "centos::yum-repos-pgdg-92-centos"

execute "yum install postgresql92-server postgresql92-devel postgresql92-contrib" do
  user "root"
  command "yum --enablerepo=pgdg92 -y install postgresql92-server postgresql92-devel postgresql92-contrib"
end

execute "initdb" do
  user "root"
  command "/etc/rc.d/init.d/postgresql-9.2 initdb"
  creates "/var/lib/pgsql/9.2/pgstartup.log"
end

service "postgresql-9.2" do
  supports :start => true, :stop => true, :restart=>true
  action :enable
end
