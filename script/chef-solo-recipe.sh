wdir=$(cd $(dirname $0); pwd)

recipe=$1

sh $wdir/../update-chef.sh

sudo chef-solo -o recipe[$recipe]


