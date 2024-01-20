module component_tutorial (CLOCK_50, KEY, HEX0, SW); 

	input CLOCK_50; 
	input KEY;
	input [3:0] SW;
	output [0:6] HEX0; 
	wire [15:0] to_HEX;
	
	embedded_system U0 ( 
		.clk_clk(CLOCK_50), 
		.reset_reset_n(KEY), 
		.to_hex_readdata(to_HEX),
		.switches_export(SW)
	); 
	
	hex7seg h0(to_HEX[3:0], HEX0);
	
endmodule 