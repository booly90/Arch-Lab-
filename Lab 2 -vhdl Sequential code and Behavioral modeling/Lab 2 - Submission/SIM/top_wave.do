onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb/L0/valid_int
add wave -noupdate -radix decimal /tb/L0/sum_2_DetCode
add wave -noupdate -radix decimal /tb/L0/out2_int
add wave -noupdate -radix decimal /tb/L0/out1_int
add wave -noupdate -radix decimal /tb/L0/detector
add wave -noupdate -radix decimal /tb/L0/DetectionCode
add wave -noupdate -radix decimal /tb/L0/adder_in
add wave -noupdate /tb/L0/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3999382 ps} 0}
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
WaveRestoreZoom {2407315 ps} {2455360 ps}
