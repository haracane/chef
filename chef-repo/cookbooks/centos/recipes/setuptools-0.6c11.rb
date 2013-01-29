tarball = "setuptools-0.6c11.tar.gz"
dirname = tarball.gsub(/\.tar\.gz$/, "")

execute "download setuptools" do
  user "root"
  cwd "/root/src"
  command "curl -L -O http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz"
  creates tarball
end

execute "extract setuptools" do
  user "root"
  cwd "/root/src"
  command "tar zxvf #{tarball}"
  creates dirname
end

execute "install setuptools" do
  user "root"
  cwd "/root/src/#{dirname}"
  command "python setup.py install"
  creates "/usr/bin/easy_install"
end
