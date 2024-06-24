onerror {resume}
add list -width 22 /tb/DataPathUnit/clk
add list /tb/DataPathUnit/rst
add list /tb/DataPathUnit/TB_Data_wren
add list /tb/DataPathUnit/TBactive
add list /tb/DataPathUnit/TB_DataMem_Data_in
add list /tb/DataPathUnit/TB_Data_writeAddr
add list /tb/DataPathUnit/TB_Data_readAddr
add list /tb/DataPathUnit/mov
add list /tb/DataPathUnit/done
add list /tb/DataPathUnit/and_bit
add list /tb/DataPathUnit/or_bit
add list /tb/DataPathUnit/xor_bit
add list /tb/DataPathUnit/jnc
add list /tb/DataPathUnit/jc
add list /tb/DataPathUnit/jmp
add list /tb/DataPathUnit/sub
add list /tb/DataPathUnit/add
add list /tb/DataPathUnit/ld
add list /tb/DataPathUnit/st
add list /tb/DataPathUnit/Nflag
add list /tb/DataPathUnit/Zflag
add list /tb/DataPathUnit/Cflag
add list /tb/DataPathUnit/DataMem_Data_out
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
