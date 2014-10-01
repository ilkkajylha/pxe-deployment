#!/bin/bash
#description: arch linux

#TMPDIR=$(mktemp -d)
TMPDIR=/tmp/archlinux
mkdir $TMPDIR
cd $TMPDIR
wget -c http://ftp.eenet.ee/pub/archlinux/iso/2014.10.01/archlinux-2014.10.01-dual.iso
wget -c http://ftp.eenet.ee/pub/archlinux/iso/2014.10.01/md5sums.txt

grep archlinux-2014.10.01-dual.iso md5sums.txt > md5sum.txt
md5sum -c md5sum.txt

mkdir -p $TMPDIR/mount 

sudo mount -o loop,ro archlinux-2013.11.01-dual.iso /$TMPDIR/mount



