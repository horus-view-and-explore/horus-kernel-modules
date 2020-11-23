obj-m := hellohorus.o


KERNELDIR ?= ${PKG_CONFIG_SYSROOT_DIR}/usr/src/kernel
PWD := $(shell pwd)

.PHONY: build clean

build:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c modules.order  Module.symvers



$(info Building with KERNELRELEASE = ${KERNELRELEASE})

