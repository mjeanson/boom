# SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1)

ifneq ($(KERNELRELEASE),)

  # This part of the Makefile is used when called by the kernel build system
  # and defines the modules to be built.

  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
    ifeq ($(CONFIG_TRACEPOINTS),)
      $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
    endif # CONFIG_TRACEPOINTS
  endif # ifdef CONFIG_LOCALVERSION

  TOP_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))

  ccflags-y += -I$(TOP_MODULES_DIR) -fno-inline-small-functions

  obj-m += boom.o

else # KERNELRELEASE

# This part of the Makefile is used when the 'make' command is runned in the
# base directory of the lttng-modules sources. It sets some environment and
# calls the kernel build system to build the actual modules.

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
CFLAGS = $(EXTCFLAGS)

default: modules

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

%.i: %.c
	$(MAKE) -C $(KERNELDIR) M=$(PWD) $@

endif # KERNELRELEASE
