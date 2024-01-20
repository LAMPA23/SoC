module hex7seg (hex, display); 

	input [3:0] hex; 
	output reg [0:6] display;
	
	/* - 0 - 
	* 5 | | 1 
	* - 6 - 
	* 4 | | 2 
	* - 3 - 
	*/
	
	always @ (hex) 
		case (hex) 
			4'h0: display = 7'b1111110; 
			4'h1: display = 7'b0110000; 
			4'h2: display = 7'b1101101; 
			4'h3: display = 7'b1111001; 
			4'h4: display = 7'b0110011; 
			4'h5: display = 7'b1011011; 
			4'h6: display = 7'b1011111; 
			4'h7: display = 7'b1110000; 
			4'h8: display = 7'b1111111; 
			4'h9: display = 7'b1110011; 
			4'hA: display = 7'b1110111; 
			4'hb: display = 7'b0011111; 
			4'hC: display = 7'b1001110; 
			4'hd: display = 7'b0111101; 
			4'hE: display = 7'b1001111; 
			4'hF: display = 7'b1000111;
		endcase 
		
endmodule 