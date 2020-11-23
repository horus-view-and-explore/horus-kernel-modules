# Kernel Module Compiling
In order to compile a kernel module for your embedded device, the corresponding SDK (yocto) needs to be installed. These can be requested or downloaded from
[http://embed.horus.nu](http://embed.horus.nu).

### Installing the SDK
In this example we downloaded and executed: `fslc-x11-glibc-x86_64-core-image-x11-cortexa9t2hf-neon-imx6qdl-variscite-som-toolchain-3.1.sh`.
```console
FSLC X11 SDK installer version 3.1
==================================
Enter target directory for SDK (default: /opt/fslc-x11/3.1): /home/auke/yoctosdk/fslc-x11/3.1
You are about to install the SDK to "/home/auke/yoctosdk/fslc-x11/3.1". Proceed [Y/n]? y
Extracting SDK....................done
Setting it up...done
Setting up IceCream distributed compiling...
creating /home/auke/yoctosdk/fslc-x11/3.1/sysroots/x86_64-fslcsdk-linux/usr/share/arm-fslc-linux-gnueabi-icecream/fslc-x11-glibc-x86_64-arm-fslc-linux-gnueabi-3.1.tar.gz
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /home/auke/yoctosdk/fslc-x11/3.1/environment-setup-cortexa9t2hf-neon-fslc-linux-gnueabi
```
### Compiling Environment
If you have not done so already, we  will obtain the following repository:
```console
git clone https://github.com/horus-view-and-explore/horus-kernel-modules.git
```
Next up will be to source the SDK environment variables into our current session,
```console
$ . /home/auke/yoctosdk/fslc-x11/3.1/environment-setup-cortexa9t2hf-neon-fslc-linux-gnueabi
```
after which we need to initialize the environment.
```console
└─ ⟫ cd ~/workspace/git/horus-kernel-modules/
└─ ⟫ ./init.sh 

Setting up kernel module compilation....

sysroot detected:          /home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi

Kernel src found:          /home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi/usr/src/kernel
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/bin2c
  HOSTCC  scripts/kconfig/conf.o
  ...
scripts/kconfig/conf  --silentoldconfig Kconfig
  WRAP    arch/arm/include/generated/uapi/asm/bitsperlong.h
  WRAP    arch/arm/include/generated/uapi/asm/errno.h
  WRAP    arch/arm/include/generated/uapi/asm/ioctl.h
  WRAP    arch/arm/include/generated/uapi/asm/ipcbuf.h
  ...
Compiling the 'Hello Horus example'.
Building with KERNELRELEASE = 
make ARCH=arm CROSS_COMPILE=arm-fslc-linux-gnueabi- -C /home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi/usr/src/kernel M=/home/auke/workspace/git/horus-kernel-modules/examples/hellohorus modules
make[1]: Entering directory '/home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi/lib/modules/4.14.78-mx6+gc691a06e96f7/build'
Building with KERNELRELEASE = 4.14.78-mx6+gc691a06e96f7
  CC [M]  /home/auke/workspace/git/horus-kernel-modules/examples/hellohorus/hellohorus.o
  Building modules, stage 2.
Building with KERNELRELEASE = 4.14.78-mx6+gc691a06e96f7
  MODPOST 1 modules
  CC      /home/auke/workspace/git/horus-kernel-modules/examples/hellohorus/hellohorus.mod.o
  LD [M]  /home/auke/workspace/git/horus-kernel-modules/examples/hellohorus/hellohorus.ko
make[1]: Leaving directory '/home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi/lib/modules/4.14.78-mx6+gc691a06e96f7/build'
/home/auke/yoctosdk/fslc-x11/3.1/sysroots/cortexa9t2hf-neon-fslc-linux-gnueabi/usr/src/kernel
```
If all went according to plan then the kernel module  `hellohorus.ko` can be found in the `horus-kernel-modules/examples/hellohorus` folder.

Inserting/removing the `hellohorus.ko`
```console
insmod hellohorus.ko 
rmmod hellohorus.ko 
```
 should give the following results.
```console 
dmesg
[13647.920684] Hello Horus
[13747.101437] Hello Horus exit!
```


