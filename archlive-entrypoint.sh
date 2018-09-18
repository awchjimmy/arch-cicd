## archlive-entrypoint.sh

# install archiso
pacman -Sy --noconfirm archiso

# copy live system config files
cp -r /usr/share/archiso/configs/releng archlive

# confirm copies
ls -l archlive

# create output dir
mkdir archlive/out

# /dev/shm error based on Debian system
# ref: https://wiki.archlinux.org/index.php/Install_from_existing_Linux#.2Fdev.2Fshm
mkdir /run/shm

# build
archlive/build.sh -v

# setup transfer.sh
touch .bashrc
curl https://gist.githubusercontent.com/nl5887/a511f172d3fb3cd0e42d/raw/d2f8a07aca44aa612b6844d8d5e53a05f5da3420/transfer.sh >> .bashrc
source .bashrc

# upload binary
transfer archlive/out/*.iso
