onerror {resume}
add list -width 18 /tb_addsub/ALUFN
add list /tb_addsub/x_adderSub_in
add list /tb_addsub/y_adderSub_in
add list /tb_addsub/adderSub_out
add list /tb_addsub/adderSub_cout
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
