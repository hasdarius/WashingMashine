set_property PACKAGE_PIN R3 [get_ports MODA[2]]					
set_property IOSTANDARD LVCMOS33 [get_ports MODA[2]]
set_property PACKAGE_PIN T2 [get_ports MODA[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports MODA[1]]
set_property PACKAGE_PIN T3 [get_ports MODA[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports MODA[0]]
set_property PACKAGE_PIN V2 [get_ports Temp[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports Temp[1]]
set_property PACKAGE_PIN W13 [get_ports Temp[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports Temp[0]]
set_property PACKAGE_PIN W2 [get_ports SELMA]					
set_property IOSTANDARD LVCMOS33 [get_ports SELMA]
set_property PACKAGE_PIN W17 [get_ports ClaSup]					
set_property IOSTANDARD LVCMOS33 [get_ports ClaSup]
set_property PACKAGE_PIN W14 [get_ports Rot_sel[1]]					
set_property IOSTANDARD LVCMOS33 [get_ports Rot_sel[1]]
set_property PACKAGE_PIN V15 [get_ports Rot_sel[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports Rot_sel[0]]
set_property PACKAGE_PIN W15 [get_ports Presp]					
set_property IOSTANDARD LVCMOS33 [get_ports Presp]
set_property PACKAGE_PIN V17 [get_ports reset]					
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN T1 [get_ports Start]					
set_property IOSTANDARD LVCMOS33 [get_ports Start]
set_property PACKAGE_PIN R2 [get_ports PWR]					
set_property IOSTANDARD LVCMOS33 [get_ports PWR]
set_property PACKAGE_PIN U1 [get_ports close_door]					
set_property IOSTANDARD LVCMOS33 [get_ports close_door]
set_property PACKAGE_PIN L1 [get_ports {blk}]					
set_property IOSTANDARD LVCMOS33 [get_ports {blk}]
set_property PACKAGE_PIN U16 [get_ports {rot_out[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {rot_out[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {rot_out[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {rot_out[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {rot_out[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[4]}]
#set_property PACKAGE_PIN U15 [get_ports {rot_out[5]}]					
#set_property IOSTANDARD LVCMOS33 [get_ports {rot_out[5]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
	set_property PACKAGE_PIN W5 [get_ports clk]       
 set_property IOSTANDARD LVCMOS33 [get_ports clk]
 create_clock -period 10.000 -name clk1 -waveform {0.000 5.000} -add [get_ports clk]
set_property PACKAGE_PIN W7 [get_ports {output[6]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[6]}]
        set_property PACKAGE_PIN W6 [get_ports {output[5]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[5]}]
        set_property PACKAGE_PIN U8 [get_ports {output[4]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[4]}]
        set_property PACKAGE_PIN V8 [get_ports {output[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[3]}]
        set_property PACKAGE_PIN U5 [get_ports {output[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[2]}]
        set_property PACKAGE_PIN V5 [get_ports {output[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[1]}]
        set_property PACKAGE_PIN U7 [get_ports {output[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {output[0]}]
        set_property PACKAGE_PIN U2 [get_ports {selout[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {selout[0]}]
        set_property PACKAGE_PIN U4 [get_ports {selout[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {selout[1]}]
        set_property PACKAGE_PIN V4 [get_ports {selout[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {selout[2]}]
        set_property PACKAGE_PIN W4 [get_ports {selout[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {selout[3]}]
