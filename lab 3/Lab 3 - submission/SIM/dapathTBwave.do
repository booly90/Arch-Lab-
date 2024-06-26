onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DataPathUnit/clk
add wave -noupdate /tb/DataPathUnit/rst
add wave -noupdate /tb/DataPathUnit/Mem_wr
add wave -noupdate /tb/DataPathUnit/Mem_out
add wave -noupdate /tb/DataPathUnit/Mem_in
add wave -noupdate /tb/DataPathUnit/Cout
add wave -noupdate /tb/DataPathUnit/Cin
add wave -noupdate /tb/DataPathUnit/Ain
add wave -noupdate /tb/DataPathUnit/RFin
add wave -noupdate /tb/DataPathUnit/RFout
add wave -noupdate /tb/DataPathUnit/IRin
add wave -noupdate /tb/DataPathUnit/PCin
add wave -noupdate /tb/DataPathUnit/Imm1_in
add wave -noupdate /tb/DataPathUnit/Imm2_in
add wave -noupdate /tb/DataPathUnit/OPC
add wave -noupdate /tb/DataPathUnit/RFaddr
add wave -noupdate /tb/DataPathUnit/PCsel
add wave -noupdate /tb/DataPathUnit/Prog_wren
add wave -noupdate /tb/DataPathUnit/ProgMem_Data_in
add wave -noupdate /tb/DataPathUnit/ProgMem_writeAddr
add wave -noupdate /tb/DataPathUnit/TB_Data_wren
add wave -noupdate /tb/DataPathUnit/TBactive
add wave -noupdate /tb/DataPathUnit/TB_DataMem_Data_in
add wave -noupdate /tb/DataPathUnit/TB_Data_writeAddr
add wave -noupdate /tb/DataPathUnit/TB_Data_readAddr
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
add wave -noupdate /tb/DataPathUnit/Nflag
add wave -noupdate /tb/DataPathUnit/Zflag
add wave -noupdate /tb/DataPathUnit/Cflag
add wave -noupdate /tb/DataPathUnit/DataMem_Data_out
add wave -noupdate /tb/DataPathUnit/main_BUS
add wave -noupdate /tb/DataPathUnit/Imm_1
add wave -noupdate /tb/DataPathUnit/Imm_2
add wave -noupdate /tb/DataPathUnit/RF2Bus
add wave -noupdate /tb/DataPathUnit/Bus2RF
add wave -noupdate /tb/DataPathUnit/Immid_1
add wave -noupdate /tb/DataPathUnit/Immid_2
add wave -noupdate /tb/DataPathUnit/IR2RF
add wave -noupdate /tb/DataPathUnit/offset
add wave -noupdate /tb/DataPathUnit/IR_OPC
add wave -noupdate /tb/DataPathUnit/A
add wave -noupdate /tb/DataPathUnit/B
add wave -noupdate /tb/DataPathUnit/C
add wave -noupdate /tb/DataPathUnit/DataMem2Bus
add wave -noupdate /tb/DataPathUnit/Data_wren
add wave -noupdate /tb/DataPathUnit/DataMem_Data_in
add wave -noupdate /tb/DataPathUnit/Data_writeAddr
add wave -noupdate /tb/DataPathUnit/Bus2Data_readAddr
add wave -noupdate /tb/DataPathUnit/Data_readAddr
add wave -noupdate /tb/DataPathUnit/FF2writeAddr
add wave -noupdate /tb/DataPathUnit/ProgMem_readAddr
add wave -noupdate /tb/DataPathUnit/ProgMem_DataOut
add wave -noupdate /tb/DataPathUnit/Bus2Data_writeAddr
add wave -noupdate /tb/DataPathUnit/RF_unit/sysRF
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(0)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(1)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(2)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(3)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(4)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(5)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(6)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(7)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(8)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(9)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(10)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(11)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(12)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(13)
add wave -noupdate -expand -group irrelevant_Pmem -radix hexadecimal /tb/DataPathUnit/ProgMem_unit/sysRAM(14)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(0)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(1)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(2)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(3)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(4)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(5)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(6)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(7)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(8)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(9)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(10)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(11)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(12)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(13)
add wave -noupdate -expand -group relevant_Dmem -radix hexadecimal /tb/DataPathUnit/DataMem_Module/sysRAM(14)
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5061412 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {0 ps} {26285918 ps}
