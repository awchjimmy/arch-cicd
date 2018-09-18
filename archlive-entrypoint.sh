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
mkdir /run/shm

# build
archlive/build.sh -v
