# Linux-Kernel-Module-Zig
[The Linux Kernel Module Programming Guide](https://sysprog21.github.io/lkmpg/) is a free book by Peter Jay Salzman, Michael Burian, Ori Pomerantz, Bob Mottram, Jim Huang. This repo goes over how to integrate zig when writing your own Linux kernel modules. If you'd like a quick crash course on C and Zig, check these out :

#### Zig Crash Course
- [Zig in 100 Seconds](https://www.youtube.com/watch?v=kxT8-C1vmd4)
- [A half-hour to learn Zig](https://gist.github.com/ityonemo/769532c2017ed9143f3571e5ac104e50)
- [Mitchell Hashimoto's writing on Zig](https://mitchellh.com/zig)
- [$ Zig for Impatient Devs by Isaac Harris-Holt](https://www.youtube.com/watch?v=5I4ZkmMS4-0)

#### C Crash Course
- [C in 100 Seconds](https://www.youtube.com/watch?v=U3aXWizDbQ4)
- [$ Just enough C to have fun by Kay Lack](https://www.0de5.net/stimuli/a-reintroduction-to-programming/essentials/just-enough-c-to-have-fun)
- [Beej's Guide to C Programming](https://beej.us/guide/bgc/)

> *$ - Recommended*

## What Is A Kernel Module?
> [!CAUTION]
To effectively follow this guide, there is no obligatory requirement for performing such actions. Nonetheless, a prudent approach involves executing the examples within a test distribution on a virtual machine, thus mitigating any potential risk of disrupting the system. 

A Linux kernel module is precisely defined as a code segment capable of dynamic loading and unloading within the kernel as needed. These modules enhance kernel capabilities without necessitating a system reboot. A notable example is seen in the device driver module, which facilitates kernel interaction withhardware components linked to the system. In the absence of modules, the prevailing approach leans toward monolithic kernels, requiring direct integrationof new functionalities into the kernel image. This approach leads to larger kernels and necessitates kernel rebuilding and subsequent system rebooting when new functionalities are desired.

Involvement in the development of Linux kernel modules requires a foundation in the C programming language and a track record of creating conventional programs intended for process execution. This pursuit delves into a domain where an unregulated pointer, if disregarded, may potentially trigger the total elimination of an entire file system, resulting in a scenario that necessitates a complete system reboot.


> [!IMPORTANT]
Vital information required for users to attain success.\

> 1.Modversioning: A module compiled for one kernel will not load if a different kernel is booted, unless CONFIG_MODVERSIONS is enabled in the kernel. Module versioning will be discussed later in this guide. Until module versioning is covered, the examples in this guide may not work correctly if running a kernel with modversioning turned on. However, most stock Linux distribution kernels come with modversioning enabled. If difficulties arise when loading the modules due to versioning errors, consider compiling a kernel with modversioning turned off.\

2.Using X Window System: It is highly recommended to extract, compile, and load all the examples discussed in this guide from a console. Working on these tasks within the X Window System is discouraged.\

3.SecureBoot: Numerous modern computers arrive pre-configured with UEFI SecureBoot enabled—an essential security standard ensuring booting exclusively through trusted software endorsed by the original equipment manufacturer. Certain Linux distributions even ship with the default Linux kernel configured to support SecureBoot. In these cases, the kernel module necessitates a signed security key. 

## Pre-Requisites
> [!IMPORTANT]
[] Add way to setup multipass and zig in vm ++ beautify commands
[] Add Nix support
[] Explain project structure

Linux distributions provide the commands `modprobe`, `insmod` and `depmod` within a package. On Ubuntu/Debian GNU/Linux: 
```bash
$ sudo apt-get install build-essential kmod
```

```bash
# To discover what modules are already loaded within your current kernel use the command lsmod:
$ sudo lsmod

# Modules are stored within the file /proc/modules, so you can also see them with: 
$ sudo cat /proc/modules

# This can be a long list, and you might prefer to search for something particular. To search for the fat module: 
$ sudo lsmod | grep fat

# Before building anything, it is necessary to install the header files for the kernel.
$ sudo apt-get update
$ sudo apt-get install kmod linux-headers-5.4.0-80-generic
```
The following command provides information on the available kernel header files:

```bash
$ apt-cache search linux-headers-`uname` -r
```

You should be able to install the kernel header files for the currently running kernel by running the following in a terminal:
> [!NOTE]
This won't install the headers for future updates automatically and you'll have to re-run this command every time.

```bash
$ sudo apt-get install linux-headers-$(uname -r) -I
```

A better alternative would be:

```bash
$ sudo apt-get install linux-headers-generic
```

Ubuntu will automatically update them when a new version comes out.

## Cheatsheet

#### 1. Basics of creating, compiling, installing and removing modules
```bash
modprobe - module probe
insmod   - insert module
depmod   - module dependancies?
lsmod    - list module
/proc/   - processes
<printk> - print in kernel

```


```bash
# Find info on the module
$ modinfo hello-1.ko
$ sudo lsmod | grep hello

# Load module to the Kernel
$ sudo insmod hello-1.ko

# Remove module from the Kernel
$ sudo rmmod hello_1

# Check the logs
$ sudo journalctl --since "1 hour ago" | grep kernel
```

## Man Pages References
> [!IMPORTANT]
[] Add Multipass Documentation\
[] Add Zig Downloads Reference\
[] Add all Man pages from gnu make to c lib pages
