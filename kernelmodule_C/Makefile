# You can change these variables if you want to use a different compiler or debugger
#CC = clang
#DBG = lldb
#ZCC = zog cc

obj-m += src/main.o

#  In Makefile, $(CURDIR) can set to the absolute pathname of the current working directory(after all -C options are processed, if any). See more about CURDIR in GNU make manual. 
PWD := $(CURDIR)

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules 

clean: 	
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean


# We use .PHONY to tell make to always run these commands even if a file exists
# with the same name in this directory. For more information on .PHONY, see
# https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
