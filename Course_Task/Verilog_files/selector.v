module selector (
    input clk_i,
    input rst_n_i,
    input [15:0] reg_16_i,
    output wire [6:0] seg_display_o,
    output reg [3:0] SS_o
 );

    parameter period = 50 * 10 * 1000;

    reg [63:0] counter;
    reg [3:0] seg_code;

    always @(posedge clk_i) begin
        if(rst_n_i == 0) begin
            counter <= 64'b0;
            SS_o = 4'b0;
            seg_code <= 4'b0;
        end else begin
            counter <= counter + 1;
            if (counter > period) begin
                counter <= 64'b0;
            end else if(counter > period / 4 * 3) begin
                SS_o <= 4'b1000;
                seg_code <= reg_16_i[15:12];
            end else if(counter > period / 4 * 2) begin
                SS_o <= 4'b0100;
                seg_code <= reg_16_i[11:8];
            end else if(counter > period / 4) begin
                seg_code <= reg_16_i[7:4];
                SS_o <= 4'b0010;
            end else if(counter < period / 4) begin
                SS_o <= 4'b0001;
                seg_code <= reg_16_i[3:0];
            end
        end    
    end


    seg_decode seg_decode_inst(seg_code, seg_display_o);

endmodule