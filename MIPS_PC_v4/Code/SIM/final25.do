onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mcu_tb/U_0/CPU/reset
add wave -noupdate /mcu_tb/U_0/CPU/clock
add wave -noupdate -radix hexadecimal /mcu_tb/U_0/CPU/PC
add wave -noupdate /mcu_tb/U_0/CPU/IFE/next_PC
add wave -noupdate -radix hexadecimal /mcu_tb/U_0/CPU/Instruction_out
add wave -noupdate -radix hexadecimal -childformat {{/mcu_tb/U_0/CPU/ID/register_array(0) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(1) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(2) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(3) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(4) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(5) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(6) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(7) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(8) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(9) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(10) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(11) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(12) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(13) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(14) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(15) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(16) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(17) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(18) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(19) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(20) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(21) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(22) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(23) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(24) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(25) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(26) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(27) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(28) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(29) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(30) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(31) -radix hexadecimal}} -expand -subitemconfig {/mcu_tb/U_0/CPU/ID/register_array(0) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(1) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(2) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(3) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(4) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(5) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(6) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(7) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(8) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(9) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(10) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(11) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(12) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(13) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(14) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(15) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(16) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(17) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(18) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(19) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(20) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(21) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(22) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(23) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(24) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(25) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(26) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(27) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(28) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(29) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(30) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(31) {-height 15 -radix hexadecimal}} /mcu_tb/U_0/CPU/ID/register_array
add wave -noupdate /mcu_tb/U_0/CPU/MEM/TYPE_addr
add wave -noupdate /mcu_tb/U_0/CPU/MEM/address
add wave -noupdate /mcu_tb/U_0/CPU/MEM/TYPEtoPC
add wave -noupdate /mcu_tb/U_0/CPU/MEM/read_data
add wave -noupdate /mcu_tb/U_0/CPU/CTL/INT_counter
add wave -noupdate /mcu_tb/U_0/CPU/CTL/INTR
add wave -noupdate -expand /mcu_tb/U_0/IC/irq_rising
add wave -noupdate /mcu_tb/U_0/IC/reset_counter
add wave -noupdate /mcu_tb/U_0/IC/irq
add wave -noupdate /mcu_tb/U_0/IC/irq_clr
add wave -noupdate /mcu_tb/U_0/BT/Set_BTIFG
add wave -noupdate /mcu_tb/U_0/BT/BTCNT_reg
add wave -noupdate /mcu_tb/U_0/PC_ENABLE
add wave -noupdate /mcu_tb/U_0/CPU/IFE/branch_PC
add wave -noupdate /mcu_tb/U_0/CPU/IFE/PC_plus_4
add wave -noupdate /mcu_tb/U_0/CPU/IFE/PC
add wave -noupdate /mcu_tb/U_0/CPU/IFE/Branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {702724 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 239
configure wave -valuecolwidth 195
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
WaveRestoreZoom {2266666 ps} {3694777 ps}
