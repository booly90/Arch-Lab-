onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DataPathUnit/clk
add wave -noupdate /tb/DataPathUnit/rst
add wave -noupdate /tb/DataPathUnit/TB_Data_wren
add wave -noupdate /tb/DataPathUnit/TBactive
add wave -noupdate /tb/DataPathUnit/mov
add wave -noupdate /tb/DataPathUnit/done
add wave -noupdate /tb/DataPathUnit/and_bit
add wave -noupdate /tb/DataPathUnit/or_bit
add wave -noupdate /tb/DataPathUnit/xor_bit
add wave -noupdate /tb/DataPathUnit/jnc
add wave -noupdate /tb/DataPathUnit/jc
add wave -noupdate /tb/DataPathUnit/jmp
add wave -noupdate /tb/DataPathUnit/sub
add wave -noupdate /tb/DataPathUnit/add
add wave -noupdate /tb/DataPathUnit/ld
add wave -noupdate /tb/DataPathUnit/st
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {65444 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 187
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
WaveRestoreZoom {0 ps} {1976782 ps}
