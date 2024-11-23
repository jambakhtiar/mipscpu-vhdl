onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_tb/U_0/reset
add wave -noupdate /mips_tb/U_0/clock
add wave -noupdate /mips_tb/U_0/PC
add wave -noupdate /mips_tb/U_0/address
add wave -noupdate /mips_tb/U_0/GPIOaddress
add wave -noupdate /mips_tb/U_0/DataBUS
add wave -noupdate /mips_tb/U_0/LEDR_out
add wave -noupdate /mips_tb/U_0/HEX0_out
add wave -noupdate /mips_tb/U_0/HEX1_out
add wave -noupdate /mips_tb/U_0/HEX2_out
add wave -noupdate /mips_tb/U_0/HEX3_out
add wave -noupdate /mips_tb/U_0/HEX4_out
add wave -noupdate /mips_tb/U_0/HEX5_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {349711 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 215
configure wave -valuecolwidth 100
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
WaveRestoreZoom {261224 ps} {566379 ps}
