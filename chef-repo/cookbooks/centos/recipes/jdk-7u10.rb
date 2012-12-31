execute "install jdk-7u10" do
  user "root"
  command <<-EOF
  if [ "$(rpm -qa|grep jdk-1.7.0_10)" != "" ]; then exit 0; fi
  if [ ! -f /root/src/jdk-7u10-linux-x64.rpm ]; then exit 1; fi
  rpm -Uvh /root/src/jdk-7u10-linux-x64.rpm
  EOF
end
