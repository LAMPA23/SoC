module main (
    input CLOCK_50_i,
    input KEY_rst_n_i,
    output [6:0] SEG_o,
    output [3:0] SS_o
);

    wire [31:0] reg32;

	embedded_system embedded_system_inst ( 
		.clk_clk(CLOCK_50_i), 
		.reset_reset_n(KEY_rst_n_i), 
		.reg_32_o(reg32),
	);

    selector selector_inst (
        .clk_i(CLOCK_50_i),
        .rst_n_i(KEY_rst_n_i),
        .reg_32_i(reg32),
        .seg_display_o(SEG_o),
        .SS_o(SS_o)
    );
 
endmodule