onerror {resume}
quietly virtual signal -install /mcu_tb/U_0/Intr_Controller { /mcu_tb/U_0/Intr_Controller/AddressBus(11 downto 0)} AddressBus_11_0
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mcu_tb/U_0/CPU/IFE/clock
add wave -noupdate -radix hexadecimal /mcu_tb/U_0/CPU/IFE/reset
add wave -noupdate -expand -group Fetch -radix hexadecimal /mcu_tb/U_0/CPU/IFE/Instruction
add wave -noupdate -expand -group Fetch -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC
add wave -noupdate -expand -group Fetch -radix hexadecimal /mcu_tb/U_0/CPU/IFE/PC_plus_4
add wave -noupdate -expand -group Fetch -radix hexadecimal /mcu_tb/U_0/CPU/IFE/next_PC
add wave -noupdate /mcu_tb/U_0/CPU/IFE/Read_ISR_PC
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data_1
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/read_data_2
add wave -noupdate -group Decode -radix hexadecimal -childformat {{/mcu_tb/U_0/CPU/ID/register_array(0) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(1) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(2) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(3) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(4) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(5) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(6) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(7) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(8) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(9) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(10) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(11) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(12) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(13) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(14) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(15) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(16) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(17) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(18) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(19) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(20) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(21) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(22) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(23) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(24) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(25) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(26) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(27) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(28) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(29) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(30) -radix hexadecimal} {/mcu_tb/U_0/CPU/ID/register_array(31) -radix hexadecimal}} -expand -subitemconfig {/mcu_tb/U_0/CPU/ID/register_array(0) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(1) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(2) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(3) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(4) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(5) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(6) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(7) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(8) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(9) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(10) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(11) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(12) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(13) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(14) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(15) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(16) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(17) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(18) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(19) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(20) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(21) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(22) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(23) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(24) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(25) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(26) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(27) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(28) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(29) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(30) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/ID/register_array(31) {-height 15 -radix hexadecimal}} /mcu_tb/U_0/CPU/ID/register_array
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address_0
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address_1
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_register_address
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/Instruction
add wave -noupdate -group Decode -radix hexadecimal /mcu_tb/U_0/CPU/ID/write_data
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/ALUSrc
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/BranchBeq
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/BranchBne
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/Jump
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/Jal
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/ALUop
add wave -noupdate -group Control /mcu_tb/U_0/CPU/CTL/Shift
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUCTL/ALUOp
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUCTL/Funct
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUCTL/Opcode
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUOp
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALUSrc
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/RegDst
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Wr_reg_addr
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Ainput
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Binput
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Aforward_mux
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/Bforward_mux
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALU_ctl
add wave -noupdate -group Execute -radix hexadecimal /mcu_tb/U_0/CPU/EXE/ALU_Result
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/Branch_MEM
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/JumpAddr_MEM
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/Zero_MEM
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/MEM/read_data
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/MEM/address
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/MEM/write_data
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/MEM/MemRead
add wave -noupdate -expand -group Memory -radix hexadecimal /mcu_tb/U_0/CPU/MEM/Memwrite
add wave -noupdate -group WriteBack -radix hexadecimal /mcu_tb/U_0/CPU/write_data_WB
add wave -noupdate -group WriteBack -radix hexadecimal /mcu_tb/U_0/CPU/Wr_reg_addr_WB
add wave -noupdate -group WriteBack -radix hexadecimal /mcu_tb/U_0/CPU/RegWrite_WB
add wave -noupdate -group WriteBack -radix hexadecimal /mcu_tb/U_0/CPU/WB/PC_plus_4_shifted
add wave -noupdate -group WriteBack -radix hexadecimal /mcu_tb/U_0/CPU/WB/Jal
add wave -noupdate -group Hazard /mcu_tb/U_0/CPU/Hazard/Stall_IF
add wave -noupdate -group Hazard /mcu_tb/U_0/CPU/Hazard/Stall_ID
add wave -noupdate -group Hazard /mcu_tb/U_0/CPU/Hazard/Flush_EX
add wave -noupdate -group Hazard /mcu_tb/U_0/CPU/Hazard/ForwardA
add wave -noupdate -group Hazard /mcu_tb/U_0/CPU/Hazard/ForwardB
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/DataBus
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/AddressBus
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/LED/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX0_7SEG/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX1_7SEG/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX2_7SEG/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX3_7SEG/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX4_7SEG/Latch_o
add wave -noupdate -group GPIO -radix hexadecimal /mcu_tb/U_0/IO_interface/HEX5_7SEG/Latch_o
add wave -noupdate -group ChipSelect /mcu_tb/U_0/IO_interface/ChipSelect
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTCNT_io
add wave -noupdate -expand -group {Basic Timer} /mcu_tb/U_0/Basic_Timer/BTWrite
add wave -noupdate -expand -group {Basic Timer} /mcu_tb/U_0/Basic_Timer/BTRead
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/MCLK
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/CLK
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTSSEL
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTOUTEN
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTOUT
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTIPx
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTIFG
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTHOLD
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/Addr
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTCNT
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTCTL
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTCL1
add wave -noupdate -expand -group {Basic Timer} -radix hexadecimal /mcu_tb/U_0/Basic_Timer/BTCL0
add wave -noupdate -expand -group Interrupt /mcu_tb/U_0/CPU/INTR_Active
add wave -noupdate -expand -group Interrupt -radix hexadecimal -childformat {{/mcu_tb/U_0/CPU/MemAddr(31) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(30) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(29) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(28) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(27) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(26) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(25) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(24) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(23) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(22) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(21) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(20) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(19) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(18) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(17) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(16) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(15) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(14) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(13) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(12) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(11) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(10) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(9) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(8) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(7) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(6) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(5) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(4) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(3) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(2) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(1) -radix hexadecimal} {/mcu_tb/U_0/CPU/MemAddr(0) -radix hexadecimal}} -subitemconfig {/mcu_tb/U_0/CPU/MemAddr(31) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(30) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(29) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(28) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(27) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(26) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(25) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(24) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(23) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(22) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(21) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(20) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(19) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(18) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(17) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(16) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(15) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(14) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(13) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(12) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(11) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(10) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(9) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(8) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(7) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(6) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(5) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(4) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(3) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(2) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(1) {-height 15 -radix hexadecimal} /mcu_tb/U_0/CPU/MemAddr(0) {-height 15 -radix hexadecimal}} /mcu_tb/U_0/CPU/MemAddr
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/CPU/ISRAddr
add wave -noupdate -expand -group Interrupt /mcu_tb/U_0/CPU/BranchOccured
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/CPU/EPC
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/CLR_IRQ
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/AddressBus_11_0
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/DataBus
add wave -noupdate -expand -group Interrupt -radix binary /mcu_tb/U_0/Intr_Controller/IFG
add wave -noupdate -expand -group Interrupt /mcu_tb/U_0/Intr_Controller/GIE
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/INTA
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/INTR
add wave -noupdate -expand -group Interrupt -radix binary /mcu_tb/U_0/Intr_Controller/IntrEn
add wave -noupdate -expand -group Interrupt -radix binary /mcu_tb/U_0/Intr_Controller/IntrSrc
add wave -noupdate -expand -group Interrupt -radix binary /mcu_tb/U_0/Intr_Controller/IRQ
add wave -noupdate -expand -group Interrupt -radix hexadecimal /mcu_tb/U_0/Intr_Controller/TypeReg
add wave -noupdate /mcu_tb/U_0/CPU/CTL/IF_FLUSH
add wave -noupdate /mcu_tb/U_0/CPU/CTL/ID_FLUSH
add wave -noupdate /mcu_tb/U_0/CPU/CTL/EX_FLUSH
add wave -noupdate -expand -group ISR /mcu_tb/KEY1
add wave -noupdate -expand -group ISR /mcu_tb/KEY2
add wave -noupdate -expand -group ISR /mcu_tb/KEY3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3832089 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 40
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
WaveRestoreZoom {2350791 ps} {5139433 ps}
