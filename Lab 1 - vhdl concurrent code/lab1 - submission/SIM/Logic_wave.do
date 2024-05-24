onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_logic/ALUFN
add wave -noupdate /tb_logic/y_logic
add wave -noupdate /tb_logic/x_logic
add wave -noupdate /tb_logic/Logic_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {683 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {1792 ns} {2304 ns}
