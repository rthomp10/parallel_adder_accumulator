
//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

module adder_subtractor(
	input [255:0] dataa,
	input [255:0] datab,
	input add_sub,	  // if this is 1, add; else subtract
	input clk,
	input [1:0] in_select,
	output reg [511:0] result,
	input reset
);

	always @ ( posedge clk ) begin
		if( reset ) result = 0;
		else if( add_sub && in_select == 0) 
		begin
			result[15:0]    <= dataa[15:0]    + datab[15:0];
			result[31:16]   <= dataa[31:16]   + datab[31:16];
			result[47:32]   <= dataa[47:32]   + datab[47:32];
			result[63:48]   <= dataa[63:48]   + datab[63:48];
			result[79:64]   <= dataa[79:64]   + datab[79:64];
			result[95:80]   <= dataa[95:80]   + datab[95:80];
			result[111:96]  <= dataa[111:96]  + datab[111:96];
			result[127:112] <= dataa[127:112] + datab[127:112];
			result[143:128] <= dataa[143:128] + datab[143:128];
			result[159:144] <= dataa[159:144] + datab[159:144];
			result[175:160] <= dataa[175:160] + datab[175:160];
			result[191:176] <= dataa[191:176] + datab[191:176];
			result[207:192] <= dataa[207:192] + datab[207:192];
			result[223:208] <= dataa[223:208] + datab[223:208];
			result[239:224] <= dataa[239:224] + datab[239:224];
			result[255:240] <= dataa[255:240] + datab[255:240];
			result[511:241]  <= 0;
		end
		else if (in_select == 0) begin
			result[15:0]    <= dataa[15:0]    - datab[15:0];
			result[31:16]   <= dataa[31:16]   - datab[31:16];
			result[47:32]   <= dataa[47:32]   - datab[47:32];
			result[63:48]   <= dataa[63:48]   - datab[63:48];
			result[79:64]   <= dataa[79:64]   - datab[79:64];
			result[95:80]   <= dataa[95:80]   - datab[95:80];
			result[111:96]  <= dataa[111:96]  - datab[111:96];
			result[127:112] <= dataa[127:112] - datab[127:112];
			result[143:128] <= dataa[143:128] - datab[143:128];
			result[159:144] <= dataa[159:144] - datab[159:144];
			result[175:160] <= dataa[175:160] - datab[175:160];
			result[191:176] <= dataa[191:176] - datab[191:176];
			result[207:192] <= dataa[207:192] - datab[207:192];
			result[223:208] <= dataa[223:208] - datab[223:208];
			result[239:224] <= dataa[239:224] - datab[239:224];
			result[255:240] <= dataa[255:240] - datab[255:240];
			result[511:241]  <= 0;
		    end
	end //always

endmodule 
