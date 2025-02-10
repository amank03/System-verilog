module mux_16_1(din,s,y);
input [15:0]din;
input [3:0]s;
output reg y;

always@(*) 
	begin
		case(s)
			4'b0000: y=din[0];
			4'b0001: y=din[1];
			4'b0010: y=din[2];
			4'b0011: y=din[3];
			4'b0100: y=din[4];
			4'b0101: y=din[5];
			4'b0110: y=din[6];
			4'b0111: y=din[7];
			4'b1000: y=din[8];
			4'b1001: y=din[9];
			4'b1010: y=din[10];
			4'b1011: y=din[11];
			4'b1100: y=din[12];
			4'b1101: y=din[13];
			4'b1110: y=din[14];
			4'b1111: y=din[14];
			default : y=0;
		endcase
	end

endmodule 
