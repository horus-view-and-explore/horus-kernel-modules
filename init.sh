#!/bin/bash

echo ""
echo "Setting up kernel module compilation...."
echo ""

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


# check if we can find sysroot
if [ -z "$PKG_CONFIG_SYSROOT_DIR" ]
then
		echo ""
      echo "Error: could not locate the systemroot."
      echo ""
      echo "Source the sdk environment. e.g"
		echo "└─ ⟫ . /opt/fslc-x11/3.1/environment-setup-cortexa9t2hf-neon-fslc-linux-gnueabi"
		exit

else
      echo "sysroot detected:          ${PKG_CONFIG_SYSROOT_DIR}"
fi

# check if kernel folder exists
if [ -d "$PKG_CONFIG_SYSROOT_DIR/usr/src/kernel" ] 
then
	echo
	echo "Kernel src found:          $PKG_CONFIG_SYSROOT_DIR/usr/src/kernel"
	cd $PKG_CONFIG_SYSROOT_DIR/usr/src/kernel
	make ARCH=${OECORE_TARGET_ARCH} scripts #make silentoldconfig scripts
else
	echo
   echo "Kernel src missing:        $PKG_CONFIG_SYSROOT_DIR/usr/src/kernel"
   exit
fi

#build the Hello Horus example
if [ -d "${SCRIPT_DIR}/examples/hellohorus" ]
then
	echo
	echo "Compiling the 'Hello Horus example'."
	cd "${SCRIPT_DIR}/examples/hellohorus"
	make 
	cd -
else
	echo
	echo ${SCRIPT_DIR}"/examples/hellohorus/ does not exist."
	echo "No example module wil be build."
	exit;
fi
 


