onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /alu_tb/ALUFN
add wave -noupdate -radix decimal /alu_tb/ALUout
add wave -noupdate -radix hexadecimal /alu_tb/Cflag
add wave -noupdate -radix hexadecimal /alu_tb/Nflag
add wave -noupdate -radix decimal /alu_tb/X
add wave -noupdate -radix decimal /alu_tb/Y
add wave -noupdate -radix hexadecimal /alu_tb/Zflag
add wave -noupdate -radix hexadecimal /alu_tb/L0/AddSub_out
add wave -noupdate -radix hexadecimal /alu_tb/L0/Shifter_out
add wave -noupdate -radix hexadecimal /alu_tb/L0/Logic_out
add wave -noupdate -radix hexadecimal /alu_tb/L0/AddSub_X
add wave -noupdate -radix hexadecimal /alu_tb/L0/AddSub_Y
add wave -noupdate -radix hexadecimal /alu_tb/L0/Logic_X
add wave -noupdate -radix hexadecimal /alu_tb/L0/Logic_Y
add wave -noupdate -radix hexadecimal /alu_tb/L0/Shifter_X
add wave -noupdate -radix hexadecimal /alu_tb/L0/Shifter_Y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {123041 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
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
WaveRestoreZoom {0 ps} {2100 ns}
