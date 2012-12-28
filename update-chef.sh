WDIR=$(dirname $0)

cd $WDIR
sudo cp -r chef-repo /var/
if [ ! -d /etc/chef ]; then
  sudo mkdir -p /etc/chef
fi

echo 'file_cache_path "/tmp/chef-solo"
cookbook_path ["/var/chef-repo/cookbooks"]
role_path "/var/chef-repo/role"' | sudo tee /etc/chef/solo.rb > /dev/null

