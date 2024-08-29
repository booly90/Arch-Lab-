onerror {resume}
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(31 downto 26)} Opcode
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(25 downto 21)} Rs
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(20 downto 16)} Rt
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(16 downto 12)} Rd
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(5 downto 0)} Funct
quietly virtual signal -install /mips_tb/U_0/cpu/IFE { /mips_tb/U_0/cpu/IFE/Instruction(15 downto 0)} Imm
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mips_tb/U_0/cpu/IFE/clock
add wave -noupdate -radix hexadecimal /mips_tb/U_0/cpu/IFE/reset
add wave -noupdate -expand -group Fetch -radix hexadecimal -childformat {{/mips_tb/U_0/cpu/IFE/Instruction(31) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(30) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(29) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(28) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(27) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(26) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(25) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(24) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(23) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(22) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(21) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(20) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(19) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(18) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(17) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(16) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(15) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(14) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(13) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(12) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(11) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(10) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(9) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(8) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(7) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(6) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(5) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(4) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(3) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(2) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(1) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Instruction(0) -radix hexadecimal}} -subitemconfig {/mips_tb/U_0/cpu/IFE/Instruction(31) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(30) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(29) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(28) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(27) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(26) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(25) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(24) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(23) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(22) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(21) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(20) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(19) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(18) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(17) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(16) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(15) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(14) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(13) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(12) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(11) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(10) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(9) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(8) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(7) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(6) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(5) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(4) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(3) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(2) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(1) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Instruction(0) {-height 15 -radix hexadecimal}} /mips_tb/U_0/cpu/IFE/Instruction
add wave -noupdate -expand -group Fetch -radix hexadecimal /mips_tb/U_0/cpu/IFE/PC
add wave -noupdate -expand -group Fetch -radix hexadecimal /mips_tb/U_0/cpu/IFE/PC_plus_4
add wave -noupdate -expand -group Fetch -radix hexadecimal -childformat {{/mips_tb/U_0/cpu/IFE/Mem_Addr(7) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(6) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(5) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(4) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(3) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(2) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(1) -radix hexadecimal} {/mips_tb/U_0/cpu/IFE/Mem_Addr(0) -radix hexadecimal}} -subitemconfig {/mips_tb/U_0/cpu/IFE/Mem_Addr(7) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(6) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(5) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(4) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(3) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(2) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(1) {-height 15 -radix hexadecimal} /mips_tb/U_0/cpu/IFE/Mem_Addr(0) {-height 15 -radix hexadecimal}} /mips_tb/U_0/cpu/IFE/Mem_Addr
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/read_data_1
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/read_register_1_address
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/read_data_2
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/read_register_2_address
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/ALU_result
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/register_array
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/write_register_address
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/cpu/ID/write_data
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/ALU_ctl
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/Read_data_1
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/Read_data_2
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/Ainput
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/Binput
add wave -noupdate -group Execute -radix hexadecimal /mips_tb/U_0/cpu/EXE/ALU_Result
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/Opcode
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/RegDst
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/ALUSrc
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/MemtoReg
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/RegWrite
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/MemRead
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/MemWrite
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/clock
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/reset
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/R_format
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/Lw
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/Sw
add wave -noupdate -group {Control Signals} -radix hexadecimal /mips_tb/U_0/cpu/CTL/Beq
add wave -noupdate -expand -group Instruction -radix unsigned -childformat {{/mips_tb/U_0/cpu/IFE/Opcode(31) -radix unsigned} {/mips_tb/U_0/cpu/IFE/Opcode(30) -radix unsigned} {/mips_tb/U_0/cpu/IFE/Opcode(29) -radix unsigned} {/mips_tb/U_0/cpu/IFE/Opcode(28) -radix unsigned} {/mips_tb/U_0/cpu/IFE/Opcode(27) -radix unsigned} {/mips_tb/U_0/cpu/IFE/Opcode(26) -radix unsigned}} -subitemconfig {/mips_tb/U_0/cpu/IFE/Instruction(31) {-radix unsigned} /mips_tb/U_0/cpu/IFE/Instruction(30) {-radix unsigned} /mips_tb/U_0/cpu/IFE/Instruction(29) {-radix unsigned} /mips_tb/U_0/cpu/IFE/Instruction(28) {-radix unsigned} /mips_tb/U_0/cpu/IFE/Instruction(27) {-radix unsigned} /mips_tb/U_0/cpu/IFE/Instruction(26) {-radix unsigned}} /mips_tb/U_0/cpu/IFE/Opcode
add wave -noupdate -expand -group Instruction -radix unsigned /mips_tb/U_0/cpu/IFE/Rs
add wave -noupdate -expand -group Instruction -radix unsigned /mips_tb/U_0/cpu/IFE/Rt
add wave -noupdate -expand -group Instruction -radix unsigned /mips_tb/U_0/cpu/IFE/Rd
add wave -noupdate -expand -group Instruction -radix unsigned /mips_tb/U_0/cpu/IFE/Funct
add wave -noupdate -expand -group Instruction -radix hexadecimal /mips_tb/U_0/cpu/IFE/Imm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {196402 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 298
configure wave -valuecolwidth 62
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
WaveRestoreZoom {0 ps} {942730 ps}
