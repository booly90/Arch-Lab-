onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DataPathUnit/IR_unit/opcode
add wave -noupdate /tb/DataPathUnit/clk
add wave -noupdate /tb/DataPathUnit/rst
add wave -noupdate /tb/DataPathUnit/Mem_wr
add wave -noupdate /tb/DataPathUnit/Mem_in
add wave -noupdate /tb/DataPathUnit/IRin
add wave -noupdate /tb/DataPathUnit/Imm1_in
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
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/DataMem_Data_out
add wave -noupdate /tb/DataPathUnit/Mem_out
add wave -noupdate /tb/DataPathUnit/Cout
add wave -noupdate /tb/DataPathUnit/Cin
add wave -noupdate /tb/DataPathUnit/Ain
add wave -noupdate /tb/DataPathUnit/RFin
add wave -noupdate /tb/DataPathUnit/RFout
add wave -noupdate /tb/DataPathUnit/PCin
add wave -noupdate /tb/DataPathUnit/Imm2_in
add wave -noupdate /tb/DataPathUnit/OPC
add wave -noupdate /tb/DataPathUnit/RFaddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Imm_1
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Imm_2
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/RF2Bus
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Bus2RF
add wave -noupdate /tb/DataPathUnit/ALU_Module/Ain
add wave -noupdate /tb/DataPathUnit/ALU_Module/REG_A
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/B
add wave -noupdate /tb/DataPathUnit/ALU_Module/MASTER_C
add wave -noupdate /tb/DataPathUnit/ALU_Module/c_slave
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Immid_1
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Immid_2
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/IR2RF
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/IR_OPC
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/A
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/C
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/DataMem2Bus
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Data_wren
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/DataMem_Data_in
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Data_writeAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Bus2Data_readAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Data_readAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/FF2writeAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/ProgMem_readAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/ProgMem_DataOut
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/Bus2Data_writeAddr
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/main_BUS
add wave -noupdate -childformat {{/tb/DataPathUnit/RF_unit/sysRF(0) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(1) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(2) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(3) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(4) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(5) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(6) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(7) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(8) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(9) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(10) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(11) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(12) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(13) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(14) -radix hexadecimal} {/tb/DataPathUnit/RF_unit/sysRF(15) -radix hexadecimal}} -expand -subitemconfig {/tb/DataPathUnit/RF_unit/sysRF(0) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(1) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(2) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(3) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(4) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(5) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(6) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(7) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(8) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(9) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(10) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(11) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(12) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(13) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(14) {-height 15 -radix hexadecimal} /tb/DataPathUnit/RF_unit/sysRF(15) {-height 15 -radix hexadecimal}} /tb/DataPathUnit/RF_unit/sysRF
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
add wave -noupdate /tb/DataPathUnit/IR_unit/opcode
add wave -noupdate /tb/DataPathUnit/PC_unit/PC_current
add wave -noupdate /tb/DataPathUnit/OPCdecoder_unit/IRopBits
add wave -noupdate -radix hexadecimal /tb/DataPathUnit/IR_unit/IR_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1827439 ps} 0}
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
WaveRestoreZoom {1479765 ps} {2413397 ps}
