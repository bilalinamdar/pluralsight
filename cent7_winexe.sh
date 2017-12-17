#update yum library
sudo yum update -y

# original source code
# http://rand0m.org/2015/08/05/winexe-1-1-centos-6-and-windows-2012-r2/
# make sure EPEL is enabled in /etc/yum.repos.d/epel.repo

# fixup a bunch of samba dependencies
sudo yum install -y gcc perl mingw-binutils-generic mingw-filesystem-base mingw32-binutils mingw32-cpp mingw32-crt mingw32-filesystem mingw32-gcc mingw32-headers mingw64-binutils mingw64-cpp mingw64-crt mingw64-filesystem mingw64-gcc mingw64-headers libcom_err-devel popt-devel zlib-devel zlib-static glibc-devel glibc-static python-devel
sudo yum install -y git gnutls-devel libacl1-dev libacl-devel libldap2-dev openldap-devel

#per the docs, remove libbsd-devel if installed
yum remove libbsd-devel

#clone the git repos. samba is huge, like 280MB
cd /usr/src
sudo git clone git://git.code.sf.net/p/winexe/winexe-waf winexe-winexe-waf
sudo git clone git://git.samba.org/samba.git samba

#per winexe bug 64, samba needs to be reverted to a6bda1f2bc85779feb9680bc74821da5ccd401c5
#
cd /usr/src/samba
sudo git reset --hard a6bda1f2bc85779feb9680bc74821da5ccd401c5

#fixup the build deps. I chose to build it as big and static as I could, so the only linked dependency is gnutls
cd /usr/src/winexe-winexe-waf/source
# modify 'wscript_build', and at the very end ...
# stlib='smb_static bsd z resolv rt'
# lib='dl gnutls'
sudo sed -i "s/lib='dl'/lib='dl gnutls'/" wscript_build 


#build it! this does a huge configure, then also compiles samba, which takes a while.
sudo ./waf --samba-dir=../../samba configure build

#executable should be  /usr/src/winexe-winexe-waf/source/build/winexe-static
