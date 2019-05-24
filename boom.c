/* SPDX-License-Identifier: (GPL-2.0 or LGPL-2.1) */

#include <linux/module.h>
#include <wrapper/vmalloc.h>

static void init_first_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void init_second_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void init_third_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void init_fourth_call(void)
{
	wrapper_vmalloc_sync_all();
}


static void exit_first_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void exit_second_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void exit_third_call(void)
{
	wrapper_vmalloc_sync_all();
}

static void exit_fourth_call(void)
{
	wrapper_vmalloc_sync_all();
}


static int __init boom_init(void)
{
	init_first_call();
	init_second_call();
	init_third_call();
	init_fourth_call();

	printk(KERN_NOTICE "Boom: Loaded\n");

	return 0;
}

static void __exit boom_exit(void)
{
	exit_first_call();
	exit_second_call();
	exit_third_call();
	exit_fourth_call();

	printk(KERN_NOTICE "Boom: Unloaded\n");
}

module_init(boom_init);
module_exit(boom_exit);

MODULE_LICENSE("GPL and additional rights");
MODULE_AUTHOR("Michael Jeanson <mjeanson@efficios.com>");
MODULE_DESCRIPTION("Big boom badaboum");
MODULE_VERSION("0.1");
