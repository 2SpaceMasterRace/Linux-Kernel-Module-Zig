/*
simple kernel module

<linux/module.h> : Needed by all Linux Kernel Modules
<linux/printk.h> : Needed for all pr_info()

non 0 return would mean the init module has failed ; the module can't be loaded

*/

#include <linux/module.h>
#include <linux.printk.h>

int init_module(void){
  pr_info("Hello World!\n");
  return 0;
}

void cleanup_module(void){
  pr_info("Goodbye, World!\n");
}

MODULE_LICENSE("GPL");
