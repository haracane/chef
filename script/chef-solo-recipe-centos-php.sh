wdir=$(cd $(dirname $0); pwd)

sh $wdir/../update-chef.sh

sudo chef-solo -o recipe[centos::php]

