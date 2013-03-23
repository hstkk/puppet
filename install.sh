
apt-get install puppet
apt-get install aptitude
puppet apply --modulepath=`pwd`/modules manifests/site.pp
