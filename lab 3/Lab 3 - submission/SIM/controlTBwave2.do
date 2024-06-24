onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controltb/Control_instance/clk
add wave -noupdate /controltb/Control_instance/mov
add wave -noupdate /controltb/jmp
add wave -noupdate /controltb/Control_instance/ld
add wave -noupdate /controltb/Control_instance/Ain
add wave -noupdate /controltb/Control_instance/C_out
add wave -noupdate /controltb/Control_instance/C_in
add wave -noupdate /controltb/Control_instance/RFin
add wave -noupdate /controltb/Control_instance/PCin
add wave -noupdate /controltb/Control_instance/RFout
add wave -noupdate /controltb/Control_instance/IRin
add wave -noupdate /controltb/Control_instance/PCsel
add wave -noupdate /controltb/Control_instance/RFaddr
add wave -noupdate /controltb/Control_instance/OPC
add wave -noupdate /controltb/Control_instance/done_TB
add wave -noupdate /controltb/Control_instance/Imm2_in
add wave -noupdate /controltb/Control_instance/mem_wr
add wave -noupdate /controltb/Control_instance/mem_out
add wave -noupdate /controltb/Control_instance/mem_in
add wave -noupdate /controltb/Control_instance/Imm1_in
add wave -noupdate /controltb/Control_instance/current_state
add wave -noupdate /controltb/Control_instance/next_state
add wave -noupdate /controltb/mov
add wave -noupdate /controltb/done_DTCM
add wave -noupdate /controltb/and_op
add wave -noupdate /controltb/or_op
add wave -noupdate /controltb/xor_op
add wave -noupdate /controltb/jnc
add wave -noupdate /controltb/jc
add wave -noupdate /controltb/jmp
add wave -noupdate /controltb/sub
add wave -noupdate /controltb/add
add wave -noupdate /controltb/Nflag
add wave -noupdate /controltb/Zflag
add wave -noupdate /controltb/Cflag
add wave -noupdate /controltb/ld
add wave -noupdate /controltb/st
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11079645 ps} 0} {{Cursor 2} {418803 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 248
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
WaveRestoreZoom {0 ps} {29237952 ps}
