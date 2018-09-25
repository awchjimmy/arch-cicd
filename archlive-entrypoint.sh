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
# echo "start to find .iso"
# find . -type f -name "*.iso"

# upload to transfer.sh
curl --upload-file ./out/*.iso https://transfer.sh/archlive.iso
