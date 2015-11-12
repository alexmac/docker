#rootdir=`mktemp -d`
rootdir=/tmp/dockerbuild2
srcdir=$rootdir/src/github.com/docker/docker
mkdir -p "$srcdir"

pushd "$srcdir"
git clone https://github.com/alexmac/docker.git .
git clean -fd
git reset --hard 1eb29211fad7c4c6293807f3cd2660c13c23fbf4

#export EXTLDFLAGS_STATIC=""
export GOPATH=$rootdir

go get github.com/Sirupsen/logrus
go get github.com/opencontainers/runc/libcontainer

export AUTO_GOPATH=1
bash -xe hack/make.sh dynbinary
