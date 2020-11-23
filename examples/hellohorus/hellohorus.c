/*
 * hellohorus.c
 *
 *  Created on: Nov 20, 2020
 *      Author: aukedirk@horus.nu
 */
#include <linux/module.h>

static int __init hello_init(void)
{
	pr_info("Hello Horus");
	return 0;
}

static void __exit hello_exit(void)
{
	pr_info("Hello Horus exit!\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Auke-Dirk Pietersma <aukedirk@horus.nu>");
MODULE_DESCRIPTION("Tutorial using the yocto SDK to build kernel module");

