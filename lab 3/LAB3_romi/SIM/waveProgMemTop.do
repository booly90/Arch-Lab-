onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/clk
add wave -noupdate /tb_top/rst
add wave -noupdate /tb_top/ena
add wave -noupdate /tb_top/Done
add wave -noupdate /tb_top/Doner1
add wave -noupdate /tb_top/Doner2
add wave -noupdate /tb_top/TBactive
add wave -noupdate /tb_top/TB_DTCM_wren
add wave -noupdate -radix hexadecimal /tb_top/TB_DTCM_W_Addr
add wave -noupdate -radix hexadecimal /tb_top/TB_DTCM_R_Addr
add wave -noupdate -radix hexadecimal /tb_top/TB_DTCM_in
add wave -noupdate -radix hexadecimal /tb_top/TB_DTCM_out
add wave -noupdate /tb_top/L1/Data_wren
add wave -noupdate /tb_top/L1/TBactive
add wave -noupdate -radix hexadecimal /tb_top/L1/DataMem_Data_in
add wave -noupdate -radix hexadecimal /tb_top/L1/Data_writeAddr
add wave -noupdate -radix hexadecimal /tb_top/L1/Data_readAddr
add wave -noupdate /tb_top/L1/tb_done
add wave -noupdate -radix hexadecimal /tb_top/L1/DataMem_Data_out
add wave -noupdate /tb_top/L1/Datapath_Unit/TB_Data_wren
add wave -noupdate /tb_top/L1/Datapath_Unit/TBactive
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/TB_DataMem_Data_in
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/TB_Data_writeAddr
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/TB_Data_readAddr
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/DataMem_Data_out
add wave -noupdate /tb_top/L1/Datapath_Unit/Data_wren
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/DataMem_Data_in
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/Data_writeAddr
add wave -noupdate -radix hexadecimal /tb_top/L1/Datapath_Unit/Data_readAddr
add wave -noupdate /tb_top/L1/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58352 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 291
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
WaveRestoreZoom {0 ps} {2000386 ps}
