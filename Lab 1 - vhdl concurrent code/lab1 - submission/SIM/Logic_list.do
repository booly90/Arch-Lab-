onerror {resume}
add list -width 17 /tb_logic/ALUFN
add list /tb_logic/y_logic
add list /tb_logic/x_logic
add list /tb_logic/Logic_out
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
