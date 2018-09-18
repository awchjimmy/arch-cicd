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

# upload to transfer.sh
curl --upload-file archlive/out/*.iso https://transfer.sh/archlive.iso
