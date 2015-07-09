MOD=am2301

KERNEL_SRC=/lib/modules/$(shell uname -r)/build

obj-m := $(MOD).o


all:
	ARCH=arm CROSS_COMPILE=${CCPREFIX} $(MAKE) -C ${KERNEL_SRC} M=$(PWD) modules

clean:
	ARCH=arm CROSS_COMPILE=${CCPREFIX} $(MAKE) -C ${KERNEL_SRC} M=$(PWD) clean
