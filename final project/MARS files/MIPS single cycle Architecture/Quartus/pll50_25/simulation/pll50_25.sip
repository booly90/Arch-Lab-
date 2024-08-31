set_global_assignment -entity "pll50_25" -library "lib_pll50_25" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "pll50_25" -library "lib_pll50_25" -name IP_TOOL_VERSION "21.1"
set_global_assignment -entity "pll50_25" -library "lib_pll50_25" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_pll50_25" -name SPD_FILE [file join $::quartus(sip_path) "../pll50_25.spd"]
set_global_assignment -library "lib_pll50_25" -name MISC_FILE [file join $::quartus(sip_path) "../../pll50_25.qsys"]

set_global_assignment -library "lib_pll50_25" -name MISC_FILE [file join $::quartus(sip_path) "pll50_25.vhd"]
set_global_assignment -library "lib_pll50_25" -name MISC_FILE [file join $::quartus(sip_path) "submodules/pll50_25_pll_0.vho"]
