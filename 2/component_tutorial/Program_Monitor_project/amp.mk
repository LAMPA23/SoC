# Created by the Intel FPGA Monitor Program
# DO NOT MODIFY

############################################
# Global Macros

DEFINE_COMMA			:= ,

############################################
# Compilation Macros

# Programs
AS		:= nios2-elf-as.exe
CC		:= nios2-elf-gcc.exe
LD		:= nios2-elf-ld.exe
OC		:= nios2-elf-objcopy.exe
RM		:= rm -f

# Flags
USERCCFLAGS	:= -g -O1 -ffunction-sections -fverbose-asm -fno-inline -mno-cache-volatile
USERLDFLAGS	:= 
ARCHASFLAGS	:= --gstabs -I "C:/intelFPGA_lite/18.1/nios2eds/components/altera_nios2/sdk/inc/"
ARCHCCFLAGS	:= -mhw-mul -mno-hw-div -I "C:/intelFPGA_lite/18.1/nios2eds/components/altera_nios2/HAL/inc/" -DSYSTEM_BUS_WIDTH=32 -DALT_SINGLE_THREADED -D_JTAG_UART_BASE=8216u
ARCHLDFLAGS	:= --defsym nasys_stack_top=0x1000 --defsym nasys_program_mem=0x0 --defsym nasys_data_mem=0x0
ARCHLDSCRIPT	:= --script="C:/intelFPGA_lite/18.1/University_Program/Monitor_Program/build/nios_cpp_build.ld"
ASFLAGS		:= $(ARCHASFLAGS)
CCFLAGS		:= -Wall -c $(USERCCFLAGS) $(ARCHCCFLAGS)
LDFLAGS		:= $(patsubst %, -Wl$(DEFINE_COMMA)%, $(ARCHLDFLAGS)) $(patsubst %, -Wl$(DEFINE_COMMA)%, $(ARCHLDSCRIPT)) $(USERLDFLAGS)
OCFLAGS		:= -O srec

# Files
HDRS		:=
SRCS		:= ../app_software_c/main.c amp/lib/src/niosII_jtag_uart.c
OBJS		:= $(patsubst %, %.o, $(SRCS))

############################################
# GDB Macros

############################################
# System Macros

# Programs
SYS_PROG_QP_PROGRAMMER	:= quartus_pgm.exe
SYS_PROG_QP_HPS			:= quartus_hps.exe
SYS_PROG_SYSTEM_CONSOLE	:= system-console.exe
SYS_PROG_NII_GDB_SERVER	:= nios2-gdb-server.exe

# Flags
SYS_FLAG_CABLE			:= -c "DE-SoC [USB-1]"
SYS_FLAG_USB			:= "USB-1"
SYS_FLAG_JTAG_INST		:= --instance
SYS_FLAG_NII_HALT		:= --stop

# Files
SYS_FILE_SOF			:= "C:/Users/bimee/OneDrive/SoC/2/component_tutorial/output_files/component_tutorial.sof"
SYS_SCRIPT_JTAG_ID		:= --script="C:/intelFPGA_lite/18.1/University_Program/Monitor_Program/bin/jtag_instance_check.tcl"
SYS_FILE_ARM_PL			:= --preloader ""
SYS_FLAG_ARM_PL_ADDR	:= --preloaderaddr null

############################################
# Compilation Targets

COMPILE: main.srec

main.srec: main.elf
	$(RM) $@
	$(OC) $(OCFLAGS) $< $@

main.elf: $(OBJS)
	$(RM) $@
	$(CC) $(OBJS) $(LDFLAGS) -o $@

%.c.o: %.c $(HDRS)
	$(RM) $@
	$(CC) $(CCFLAGS) $< -o $@

%.s.o: %.s $(HDRS)
	$(RM) $@
	$(AS) $(ASFLAGS) $< -o $@

CLEAN: 
	$(RM) main.srec main.elf $(OBJS)

############################################
# System Targets

DETECT_DEVICES:
	$(SYS_PROG_QP_PROGRAMMER) $(SYS_FLAG_CABLE) --auto

ARM_RUN_PRELOADER:
	$(SYS_PROG_QP_HPS) $(SYS_FLAG_CABLE) -o GDBSERVER -gdbport0 $(SYS_ARG_GDB_PORT) $(SYS_FILE_ARM_PL) $(SYS_FLAG_ARM_PL_ADDR) 

DOWNLOAD_SYSTEM:
	$(SYS_PROG_QP_PROGRAMMER) $(SYS_FLAG_CABLE) -m jtag -o P\;$(SYS_FILE_SOF)@$(SYS_ARG_JTAG_INDEX) 

CHECK_JTAG_ID:
	$(SYS_PROG_SYSTEM_CONSOLE) $(SYS_SCRIPT_JTAG_ID) $(SYS_FLAG_USB) $(SYS_FILE_SOF) 

HALT_NII:
	$(SYS_PROG_NII_GDB_SERVER) $(SYS_FLAG_CABLE) $(SYS_FLAG_JTAG_INST) $(SYS_ARG_JTAG_INDEX) $(SYS_FLAG_NII_HALT) 

