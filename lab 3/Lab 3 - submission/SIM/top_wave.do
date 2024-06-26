onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/top_tb/datapath_unit/IR_unit/Op
add wave -noupdate /tb_top/top_tb/datapath_unit/IR_unit/opcode
add wave -noupdate /tb_top/top_tb/datapath_unit/ProgMem_unit/memEn
add wave -noupdate /tb_top/top_tb/datapath_unit/PC_unit/PC_next
add wave -noupdate /tb_top/addr_size
add wave -noupdate /tb_top/Awidth
add wave -noupdate /tb_top/clk
add wave -noupdate /tb_top/dept
add wave -noupdate /tb_top/Done
add wave -noupdate /tb_top/Doner1
add wave -noupdate /tb_top/Doner2
add wave -noupdate /tb_top/Dwidth
add wave -noupdate /tb_top/ena
add wave -noupdate /tb_top/OffsetSize
add wave -noupdate /tb_top/read_file_loc
add wave -noupdate /tb_top/read_file_loc2
add wave -noupdate /tb_top/rst
add wave -noupdate /tb_top/TB_DTCM_in
add wave -noupdate /tb_top/TB_DTCM_out
add wave -noupdate /tb_top/TB_DTCM_R_Addr
add wave -noupdate /tb_top/TB_DTCM_W_Addr
add wave -noupdate /tb_top/TB_DTCM_wren
add wave -noupdate /tb_top/TB_ITCM_in
add wave -noupdate /tb_top/TB_ITCM_W_Addr
add wave -noupdate /tb_top/TB_ITCM_wren
add wave -noupdate /tb_top/TBactive
add wave -noupdate /tb_top/ton
add wave -noupdate /tb_top/write_file_loc
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/memEn
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/Awidth
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/clk
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/dept
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/Dwidth
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/memEn
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/RmemAddr
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/RmemData
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/sysRAM
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/WmemAddr
add wave -noupdate /tb_top/top_tb/datapath_unit/DataMem_Module/WmemData
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/A
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/A_temp
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/Ain
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/B
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/B_temp
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/BusSize
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/C
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/c_slave
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/carryin
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/CFlag
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/Cin
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/clk
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/Cout
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/internal_carry
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/MASTER_C
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/Nflag
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/OPC
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/REG_A
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/s
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/wire_c
add wave -noupdate /tb_top/top_tb/datapath_unit/ALU_Module/Zflag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {16384 ns}