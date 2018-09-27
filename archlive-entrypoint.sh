## archlive-entrypoint.sh

# install archiso
pacman -Sy --noconfirm archiso

# copy live system config files
cp -r /usr/share/archiso/configs/releng /tmp/archlive

# confirm copies
ls -l /tmp/archlive

# /dev/shm error based on Debian system
# ref: https://wiki.archlinux.org/index.php/Install_from_existing_Linux#.2Fdev.2Fshm
mkdir /run/shm

# append user packages
cat ./user-packages.x86_64 >> /tmp/archlive/packages.x86_64

# build
/tmp/archlive/build.sh -v

# can't afford 10 mins building a bug...
echo "start finding .iso"
find . -type f -name "*.iso"

# upload to transfer.sh
echo "start uploading to transfer.sh"
curl -X PUT --progress-bar --upload-file $(find . -type f -name "*.iso") https://transfer.sh/archlive.iso
