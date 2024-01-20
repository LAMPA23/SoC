
module embedded_system (
	clk_clk,
	reset_reset_n,
	to_hex_readdata,
	switches_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[31:0]	to_hex_readdata;
	input	[3:0]	switches_export;
endmodule