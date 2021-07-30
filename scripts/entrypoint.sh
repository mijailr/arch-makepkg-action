#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Sy
export MAKEFLAGS=-j$(nproc)
namcap PKGBUILD
makepkg -fC --syncdeps --noconfirm

echo "==============="
echo "Package created:"
echo `ls *.pkg.tar.zst`
echo "==============="
