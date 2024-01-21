if { [file exists "work"] } { vdel -all }

vlib work

vlog C:/Users/bimee/OneDrive/SoC/Course_Task/Verilog_files/selector.v
vlog C:/Users/bimee/OneDrive/SoC/Course_Task/Verilog_files/seg_decode.v
vlog C:/Users/bimee/OneDrive/SoC/Course_Task/Verilog_Testbench/tb_for_selector.v

vsim work.tb_for_selector 


add wave -radix binary sim:/tb_for_selector/clk_i
add wave -radix binary sim:/tb_for_selector/rst_n_i

add wave -radix binary sim:/tb_for_selector/seg_display_o
add wave -radix binary sim:/tb_for_selector/SS_o

add wave -radix hexadecimal sim:/tb_for_selector/reg_16_i


onbreak resume 
run -all
scale 1ns
wave zoom full