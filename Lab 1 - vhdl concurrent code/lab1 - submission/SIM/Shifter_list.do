onerror {resume}
add list -width 19 /tb_shifter/ALUFN
add list /tb_shifter/x_Shifter_in
add list /tb_shifter/y_Shifter_in
add list /tb_shifter/Shifter_cout
add list /tb_shifter/Shifter_out
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
