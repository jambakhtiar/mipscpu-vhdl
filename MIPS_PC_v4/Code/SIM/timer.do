onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_tb/U_0/BT/clock
add wave -noupdate /mips_tb/U_0/CPU/PC
add wave -noupdate -expand /mips_tb/U_0/CPU/ID/register_array
add wave -noupdate /mips_tb/U_0/BT/reset
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
add wave -noupdate /mips_tb/U_0/BT/BTCNT_reg
add wave -noupdate /mips_tb/U_0/BT/BTCTL_reg
add wave -noupdate /mips_tb/U_0/BT/BTCCR0_reg
add wave -noupdate /mips_tb/U_0/BT/BTCCR1_reg
add wave -noupdate /mips_tb/U_0/BT/Dout_BTCTL
add wave -noupdate /mips_tb/U_0/BT/Dout_BTCNT
add wave -noupdate /mips_tb/U_0/BT/Dout_BTCCR0
add wave -noupdate /mips_tb/U_0/BT/Dout_BTCCR1
add wave -noupdate /mips_tb/U_0/BT/Din_BTCTL
add wave -noupdate /mips_tb/U_0/BT/Din_BTCNT
add wave -noupdate /mips_tb/U_0/BT/Din_BTCCR0
add wave -noupdate /mips_tb/U_0/BT/Din_BTCCR1
add wave -noupdate /mips_tb/U_0/BT/PWM_reg
add wave -noupdate /mips_tb/U_0/BT/EN_BTCTL_W
add wave -noupdate /mips_tb/U_0/BT/EN_BTCNT_W
add wave -noupdate /mips_tb/U_0/BT/EN_BTCCR0_W
add wave -noupdate /mips_tb/U_0/BT/EN_BTCCR1_W
add wave -noupdate /mips_tb/U_0/BT/EN_BTCTL_R
add wave -noupdate /mips_tb/U_0/BT/EN_BTCNT_R
add wave -noupdate /mips_tb/U_0/BT/EN_BTCCR0_R
add wave -noupdate /mips_tb/U_0/BT/EN_BTCCR1_R
add wave -noupdate /mips_tb/U_0/BT/MCLK2
add wave -noupdate /mips_tb/U_0/BT/MCLK4
add wave -noupdate /mips_tb/U_0/BT/MCLK8
add wave -noupdate /mips_tb/U_0/BT/SelCLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {251224 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
configure wave -valuecolwidth 255
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
WaveRestoreZoom {246165 ps} {263627 ps}
