onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_gpio_handler/uut/ADecoder/reset
add wave -noupdate /tb_gpio_handler/clk
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_LEDR
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_SW
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_KEY
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX0
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX1
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX2
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX3
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX4
add wave -noupdate /tb_gpio_handler/uut/ADecoder/CS_HEX5
add wave -noupdate /tb_gpio_handler/memRead
add wave -noupdate /tb_gpio_handler/memWrite
add wave -noupdate /tb_gpio_handler/uut/MemRead_gated
add wave -noupdate /tb_gpio_handler/uut/MemRead_notgated
add wave -noupdate -radix hexadecimal /tb_gpio_handler/address
add wave -noupdate -radix hexadecimal -childformat {{/tb_gpio_handler/dataBus(31) -radix hexadecimal} {/tb_gpio_handler/dataBus(30) -radix hexadecimal} {/tb_gpio_handler/dataBus(29) -radix hexadecimal} {/tb_gpio_handler/dataBus(28) -radix hexadecimal} {/tb_gpio_handler/dataBus(27) -radix hexadecimal} {/tb_gpio_handler/dataBus(26) -radix hexadecimal} {/tb_gpio_handler/dataBus(25) -radix hexadecimal} {/tb_gpio_handler/dataBus(24) -radix hexadecimal} {/tb_gpio_handler/dataBus(23) -radix hexadecimal} {/tb_gpio_handler/dataBus(22) -radix hexadecimal} {/tb_gpio_handler/dataBus(21) -radix hexadecimal} {/tb_gpio_handler/dataBus(20) -radix hexadecimal} {/tb_gpio_handler/dataBus(19) -radix hexadecimal} {/tb_gpio_handler/dataBus(18) -radix hexadecimal} {/tb_gpio_handler/dataBus(17) -radix hexadecimal} {/tb_gpio_handler/dataBus(16) -radix hexadecimal} {/tb_gpio_handler/dataBus(15) -radix hexadecimal} {/tb_gpio_handler/dataBus(14) -radix hexadecimal} {/tb_gpio_handler/dataBus(13) -radix hexadecimal} {/tb_gpio_handler/dataBus(12) -radix hexadecimal} {/tb_gpio_handler/dataBus(11) -radix hexadecimal} {/tb_gpio_handler/dataBus(10) -radix hexadecimal} {/tb_gpio_handler/dataBus(9) -radix hexadecimal} {/tb_gpio_handler/dataBus(8) -radix hexadecimal} {/tb_gpio_handler/dataBus(7) -radix hexadecimal} {/tb_gpio_handler/dataBus(6) -radix hexadecimal} {/tb_gpio_handler/dataBus(5) -radix hexadecimal} {/tb_gpio_handler/dataBus(4) -radix hexadecimal} {/tb_gpio_handler/dataBus(3) -radix hexadecimal} {/tb_gpio_handler/dataBus(2) -radix hexadecimal} {/tb_gpio_handler/dataBus(1) -radix hexadecimal} {/tb_gpio_handler/dataBus(0) -radix hexadecimal}} -subitemconfig {/tb_gpio_handler/dataBus(31) {-radix hexadecimal} /tb_gpio_handler/dataBus(30) {-radix hexadecimal} /tb_gpio_handler/dataBus(29) {-radix hexadecimal} /tb_gpio_handler/dataBus(28) {-radix hexadecimal} /tb_gpio_handler/dataBus(27) {-radix hexadecimal} /tb_gpio_handler/dataBus(26) {-radix hexadecimal} /tb_gpio_handler/dataBus(25) {-radix hexadecimal} /tb_gpio_handler/dataBus(24) {-radix hexadecimal} /tb_gpio_handler/dataBus(23) {-radix hexadecimal} /tb_gpio_handler/dataBus(22) {-radix hexadecimal} /tb_gpio_handler/dataBus(21) {-radix hexadecimal} /tb_gpio_handler/dataBus(20) {-radix hexadecimal} /tb_gpio_handler/dataBus(19) {-radix hexadecimal} /tb_gpio_handler/dataBus(18) {-radix hexadecimal} /tb_gpio_handler/dataBus(17) {-radix hexadecimal} /tb_gpio_handler/dataBus(16) {-radix hexadecimal} /tb_gpio_handler/dataBus(15) {-radix hexadecimal} /tb_gpio_handler/dataBus(14) {-radix hexadecimal} /tb_gpio_handler/dataBus(13) {-radix hexadecimal} /tb_gpio_handler/dataBus(12) {-radix hexadecimal} /tb_gpio_handler/dataBus(11) {-radix hexadecimal} /tb_gpio_handler/dataBus(10) {-radix hexadecimal} /tb_gpio_handler/dataBus(9) {-radix hexadecimal} /tb_gpio_handler/dataBus(8) {-radix hexadecimal} /tb_gpio_handler/dataBus(7) {-radix hexadecimal} /tb_gpio_handler/dataBus(6) {-radix hexadecimal} /tb_gpio_handler/dataBus(5) {-radix hexadecimal} /tb_gpio_handler/dataBus(4) {-radix hexadecimal} /tb_gpio_handler/dataBus(3) {-radix hexadecimal} /tb_gpio_handler/dataBus(2) {-radix hexadecimal} /tb_gpio_handler/dataBus(1) {-radix hexadecimal} /tb_gpio_handler/dataBus(0) {-radix hexadecimal}} /tb_gpio_handler/dataBus
add wave -noupdate -label {latch_en hex0} /tb_gpio_handler/uut/HEX0_inst/Latch_en
add wave -noupdate -label {latch hex0} -radix hexadecimal /tb_gpio_handler/uut/HEX0_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX1_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX1_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX2_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX2_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX3_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX3_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX4_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX4_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX5_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/HEX5_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/LEDR_inst/Latch_en
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/LEDR_inst/Latch_IO
add wave -noupdate -radix hexadecimal /tb_gpio_handler/uut/SW_inst/GPInput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29952 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 348
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
WaveRestoreZoom {27879 ps} {143133 ps}
