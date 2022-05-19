LN ?= ln -fs
CP ?= cp -a
MKDIR ?= mkdir -p
ROOTFS ?= rootfs
TAR ?= tar
BUILD = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))/build/
TARGET = madplay-0.15.2b/madplay
CC = "/opt/fsl-imx-fb/4.14-sumo/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/opt/fsl-imx-fb/4.14-sumo/sysroots/cortexa9hf-neon-poky-linux-gnueabi/"

all:
	cd libid3tag-0.15.1b; \
	./configure CC=$(CC) --host=arm-poky-linux-gnueabi --enable-static --disable-shared --disable-debugging --prefix=$(BUILD); \
	make; \
	make install

     
	cd libmad-0.15.1b; \
	./configure CC=$(CC) --host=arm-poky-linux-gnueabi --enable-static --disable-shared --disable-debugging --prefix=$(BUILD); \
	make; \
	make install
 
	cd madplay-0.15.2b; \
	./configure CC=$(CC) --host=arm-poky-linux-gnueabi --with-alsa --enable-static --disable-shared --disable-debugging CPPFLAGS=-I$(BUILD)/include LDFLAGS=-L$(BUILD)/lib; \
	make

clean:
	rm -rf build/

romfs:
	$(MKDIR) $(ROOTFS_DIR)/usr/bin/
	$(CP) $(TARGET) $(ROOTFS_DIR)/usr/bin/

interface:

install:


