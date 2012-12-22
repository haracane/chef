WDIR=$(dirname $0)

cd $WDIR
cp -r chef-repo /var/
mkdir -p /etc/chef

echo 'file_cache_path "/tmp/chef-solo"
cookbook_path ["/var/chef-repo/cookbooks"]
role_path "/var/chef-repo/role"' > /etc/chef/solo.rb
