# Load RUCKUS library
source -quiet $::env(RUCKUS_DIR)/vivado_proc.tcl

if { [llength [get_ips Ila_256]] == 0 } {
	create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name Ila_256
	set_property -dict [list \
		CONFIG.C_DATA_DEPTH     {1024} \
		CONFIG.C_TRIGIN_EN      {TRUE} \
		CONFIG.C_TRIGOUT_EN     {TRUE} \
		CONFIG.C_INPUT_PIPE_STAGES {2} \
		CONFIG.C_EN_STRG_QUAL      {1} \
		CONFIG.C_NUM_OF_PROBES     {4} \
		CONFIG.C_PROBE0_WIDTH     {64} \
		CONFIG.C_PROBE1_WIDTH     {64} \
		CONFIG.C_PROBE2_WIDTH     {64} \
		CONFIG.C_PROBE3_WIDTH     {64}
	] [get_ips Ila_256]
}

if { [llength [get_ips IlaAxiLiteIP]] == 0 } {
	create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name IlaAxiLiteIP
	set_property -dict [list \
		CONFIG.C_DATA_DEPTH     {1024} \
		CONFIG.C_TRIGIN_EN      {TRUE} \
		CONFIG.C_TRIGOUT_EN     {TRUE} \
		CONFIG.C_INPUT_PIPE_STAGES {2} \
		CONFIG.C_EN_STRG_QUAL      {1} \
		CONFIG.C_NUM_OF_PROBES    {19} \
		CONFIG.C_PROBE0_WIDTH     {32} \
		CONFIG.C_PROBE1_WIDTH      {3} \
		CONFIG.C_PROBE2_WIDTH      {1} \
		CONFIG.C_PROBE3_WIDTH      {1} \
		CONFIG.C_PROBE4_WIDTH     {32} \
		CONFIG.C_PROBE5_WIDTH      {2} \
		CONFIG.C_PROBE6_WIDTH      {1} \
		CONFIG.C_PROBE7_WIDTH      {1} \
		CONFIG.C_PROBE8_WIDTH     {32} \
		CONFIG.C_PROBE9_WIDTH      {3} \
		CONFIG.C_PROBE10_WIDTH     {1} \
		CONFIG.C_PROBE11_WIDTH     {1} \
		CONFIG.C_PROBE12_WIDTH    {32} \
		CONFIG.C_PROBE13_WIDTH     {4} \
		CONFIG.C_PROBE14_WIDTH     {1} \
		CONFIG.C_PROBE15_WIDTH     {1} \
		CONFIG.C_PROBE16_WIDTH     {2} \
		CONFIG.C_PROBE17_WIDTH     {1} \
		CONFIG.C_PROBE18_WIDTH     {1}
	] [get_ips IlaAxiLiteIP]
}

if { [llength [get_ips IlaAxiStreamIP]] == 0 } {
	create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name IlaAxiStreamIP
	set_property -dict [list \
		CONFIG.C_DATA_DEPTH     {1024} \
		CONFIG.C_TRIGIN_EN      {TRUE} \
		CONFIG.C_TRIGOUT_EN     {TRUE} \
		CONFIG.C_INPUT_PIPE_STAGES {2} \
		CONFIG.C_EN_STRG_QUAL      {1} \
		CONFIG.C_NUM_OF_PROBES    {10} \
		CONFIG.C_PROBE0_WIDTH     {64} \
		CONFIG.C_PROBE1_WIDTH     {64} \
		CONFIG.C_PROBE2_WIDTH     {16} \
		CONFIG.C_PROBE3_WIDTH     {16} \
		CONFIG.C_PROBE4_WIDTH      {8} \
		CONFIG.C_PROBE5_WIDTH      {8} \
		CONFIG.C_PROBE6_WIDTH     {64} \
		CONFIG.C_PROBE7_WIDTH      {1} \
		CONFIG.C_PROBE8_WIDTH      {1} \
		CONFIG.C_PROBE9_WIDTH      {1}
	] [get_ips IlaAxiStreamIP]
}


# Load Source Code
loadSource -dir  "$::DIR_PATH/rtl/"
