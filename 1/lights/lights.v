module lights (CLOCK_50, SW, KEY, LEDR); 
	input CLOCK_50; 
	input [3:0] SW; 
	input [0:0] KEY; 
	output [3:0] LEDR;
	
	// Instantiate the Nios II system module generated 
	// by the Platform Designer tool:
	
	nios_system NiosII ( 
	 .clk_clk(CLOCK_50), 
	 .reset_reset_n(KEY), 
	 .switches_export(SW), 
	 .leds_export(LEDR)); 
	 
endmodule