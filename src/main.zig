//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable.
//
//  simple kernel module but in zig
//  <linux/module.h> : Needed by all Linux Kernel Modules
//  <linux/printk.h> : Needed for all pr_info()
const std = @import("std");

const c = @cImport({
    @cInclude("linux/module.h");
    @cInclude("linux/printk.h");
});

fn init_module() !void {
    c.pr_info("Hello World!\n");
}

fn cleanup_module() !void {
    c.pr_info("Goodbye, World!\n");
}

pub fn main() !void {
    init_module();
    return 0;
}

test "simple test" {
    //  non 0 return would mean the init module has failed ; the module can't be loaded
}
