onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbcontrol/add
add wave -noupdate /tbcontrol/nop
add wave -noupdate /tbcontrol/jnc
add wave -noupdate /tbcontrol/jc
add wave -noupdate /tbcontrol/jmp
add wave -noupdate /tbcontrol/sub
add wave -noupdate /tbcontrol/mov
add wave -noupdate /tbcontrol/done_DM
add wave -noupdate /tbcontrol/Ain
add wave -noupdate /tbcontrol/Cin
add wave -noupdate /tbcontrol/Cout
add wave -noupdate /tbcontrol/Imm1_in
add wave -noupdate /tbcontrol/Imm2_in
add wave -noupdate /tbcontrol/IRin
add wave -noupdate /tbcontrol/Mem_in
add wave -noupdate /tbcontrol/Mem_out
add wave -noupdate /tbcontrol/Mem_wr
add wave -noupdate /tbcontrol/OPC
add wave -noupdate /tbcontrol/PCin
add wave -noupdate /tbcontrol/PCsel
add wave -noupdate /tbcontrol/RFaddr
add wave -noupdate /tbcontrol/RFin
add wave -noupdate /tbcontrol/RFout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {326264 ps} 0}
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
WaveRestoreZoom {0 ps} {2520 ns}
