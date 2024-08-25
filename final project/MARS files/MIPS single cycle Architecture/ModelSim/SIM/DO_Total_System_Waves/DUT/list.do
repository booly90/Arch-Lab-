onerror {resume}
add list /mips_tb/U_0/IFE/Instruction
add list /mips_tb/U_0/IFE/PC_plus_4_out
add list /mips_tb/U_0/IFE/Add_result
add list /mips_tb/U_0/IFE/Branch
add list /mips_tb/U_0/IFE/Zero
add list /mips_tb/U_0/IFE/PC_out
add list /mips_tb/U_0/IFE/clock
add list /mips_tb/U_0/IFE/reset
add list /mips_tb/U_0/IFE/PC
add list /mips_tb/U_0/IFE/PC_plus_4
add list /mips_tb/U_0/IFE/next_PC
add list /mips_tb/U_0/IFE/Mem_Addr
add list /mips_tb/U_0/ID/read_data_1
add list /mips_tb/U_0/ID/read_data_2
add list /mips_tb/U_0/ID/Instruction
add list /mips_tb/U_0/ID/read_data
add list /mips_tb/U_0/ID/ALU_result
add list /mips_tb/U_0/ID/RegWrite
add list /mips_tb/U_0/ID/MemtoReg
add list /mips_tb/U_0/ID/RegDst
add list /mips_tb/U_0/ID/Sign_extend
add list /mips_tb/U_0/ID/clock
add list /mips_tb/U_0/ID/reset
add list /mips_tb/U_0/ID/register_array
add list /mips_tb/U_0/ID/write_register_address
add list /mips_tb/U_0/ID/write_data
add list /mips_tb/U_0/ID/read_register_1_address
add list /mips_tb/U_0/ID/read_register_2_address
add list /mips_tb/U_0/ID/write_register_address_1
add list /mips_tb/U_0/ID/write_register_address_0
add list /mips_tb/U_0/ID/Instruction_immediate_value
add list /mips_tb/U_0/CTL/Opcode
add list /mips_tb/U_0/CTL/RegDst
add list /mips_tb/U_0/CTL/ALUSrc
add list /mips_tb/U_0/CTL/MemtoReg
add list /mips_tb/U_0/CTL/RegWrite
add list /mips_tb/U_0/CTL/MemRead
add list /mips_tb/U_0/CTL/MemWrite
add list /mips_tb/U_0/CTL/Branch
add list /mips_tb/U_0/CTL/ALUop
add list /mips_tb/U_0/CTL/clock
add list /mips_tb/U_0/CTL/reset
add list /mips_tb/U_0/CTL/R_format
add list /mips_tb/U_0/CTL/Lw
add list /mips_tb/U_0/CTL/Sw
add list /mips_tb/U_0/CTL/Beq
add list /mips_tb/U_0/EXE/Read_data_1
add list /mips_tb/U_0/EXE/Read_data_2
add list /mips_tb/U_0/EXE/Sign_extend
add list /mips_tb/U_0/EXE/Function_opcode
add list /mips_tb/U_0/EXE/ALUOp
add list /mips_tb/U_0/EXE/ALUSrc
add list /mips_tb/U_0/EXE/Zero
add list /mips_tb/U_0/EXE/ALU_Result
add list /mips_tb/U_0/EXE/Add_Result
add list /mips_tb/U_0/EXE/PC_plus_4
add list /mips_tb/U_0/EXE/clock
add list /mips_tb/U_0/EXE/reset
add list /mips_tb/U_0/EXE/Ainput
add list /mips_tb/U_0/EXE/Binput
add list /mips_tb/U_0/EXE/ALU_output_mux
add list /mips_tb/U_0/EXE/Branch_Add
add list /mips_tb/U_0/EXE/ALU_ctl
add list /mips_tb/U_0/MEM/read_data
add list /mips_tb/U_0/MEM/address
add list /mips_tb/U_0/MEM/write_data
add list /mips_tb/U_0/MEM/MemRead
add list /mips_tb/U_0/MEM/Memwrite
add list /mips_tb/U_0/MEM/clock
add list /mips_tb/U_0/MEM/reset
add list /mips_tb/U_0/MEM/write_clock
add list /mips_tb/U_1/clock
add list /mips_tb/U_1/reset
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta collapse
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
