onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_tb/U_0/CPU/reset
add wave -noupdate /mips_tb/U_0/BT/clock
add wave -noupdate /mips_tb/U_0/CPU/PC
add wave -noupdate /mips_tb/U_0/CPU/CTL/dis
add wave -noupdate -expand /mips_tb/U_0/CPU/ID/register_array
add wave -noupdate /mips_tb/U_0/BT/address
add wave -noupdate /mips_tb/U_0/BT/DataBus
add wave -noupdate /mips_tb/U_0/BT/MemRead
add wave -noupdate /mips_tb/U_0/BT/MemWrite
add wave -noupdate /mips_tb/U_0/BT/Set_BTIFG
add wave -noupdate /mips_tb/U_0/BT/PWM_out
add wave -noupdate /mips_tb/U_0/BT/CS
add wave -noupdate /mips_tb/U_0/BT/Dout
add wave -noupdate /mips_tb/U_0/BT/Din
add wave -noupdate /mips_tb/U_0/BT/en
add wave -noupdate /mips_tb/U_0/IC/INTR_out
add wave -noupdate /mips_tb/U_0/IC/INTA
add wave -noupdate /mips_tb/U_0/CPU/CTL/INTR
add wave -noupdate /mips_tb/U_0/CPU/CTL/INT_counter
add wave -noupdate /mips_tb/U_0/CPU/CTL/INT_cyc1
add wave -noupdate /mips_tb/U_0/CPU/CTL/INT_cyc2
add wave -noupdate /mips_tb/U_0/CPU/CTL/RegDst
add wave -noupdate /mips_tb/U_0/CPU/ID/Next_PC
add wave -noupdate /mips_tb/U_0/CPU/ID/write_register_address
add wave -noupdate /mips_tb/U_0/CPU/ID/write_data
add wave -noupdate -radix hexadecimal /mips_tb/U_0/CPU/read_data_MEM
add wave -noupdate /mips_tb/U_0/CPU/MEM/address
add wave -noupdate /mips_tb/U_0/IC/TYPE_reg
add wave -noupdate /mips_tb/U_0/CPU/DataBUS
add wave -noupdate /mips_tb/U_0/CPU/MEM/TYPE_addr
add wave -noupdate /mips_tb/U_0/CPU/MEM/TYPEtoPC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {446903 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 207
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {637317 ps}
