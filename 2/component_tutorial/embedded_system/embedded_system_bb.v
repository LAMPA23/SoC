
module embedded_system (
	clk_clk,
	reset_reset_n,
	switches_export,
	to_hex_readdata);	

	input		clk_clk;
	input		reset_reset_n;
	input	[3:0]	switches_export;
	output	[31:0]	to_hex_readdata;
endmodule
