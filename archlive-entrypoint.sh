## archlive-entrypoint.sh

# install archiso
pacman -Sy --noconfirm archiso

# copy live system config files
cp -r /usr/share/archiso/configs/releng /tmp/archlive

# confirm copies
ls -l /tmp/archlive

# create output dir
mkdir /tmp/archlive/out

# /dev/shm error based on Debian system
# ref: https://wiki.archlinux.org/index.php/Install_from_existing_Linux#.2Fdev.2Fshm
mkdir /run/shm

# build
/tmp/archlive/build.sh -v

# can't afford 10 mins building a bug...
echo "start to find .iso"
find . -type f -name "*.iso"

# upload to transfer.sh
curl --upload-file ./out/*.iso https://transfer.sh/archlive.iso
