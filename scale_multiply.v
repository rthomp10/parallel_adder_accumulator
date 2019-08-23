
//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

module scale_multiply(
	input [15:0] scalar,
	input [255:0] matrix,
	input clk,
	input [1:0] in_select,
	output reg [511:0] result,
	input reset
	);

	always @ ( posedge clk ) begin
		if( reset ) result = 0;
		else if( in_select == 1 ) begin
			result[31:0]    <= scalar * matrix[15:0];
			result[63:32]   <= scalar * matrix[31:16];
			result[95:64]   <= scalar * matrix[47:32];
			result[127:96]  <= scalar * matrix[63:48];
			result[159:128] <= scalar * matrix[79:64];
			result[191:160] <= scalar * matrix[95:80];
			result[223:192] <= scalar * matrix[111:96];
			result[255:124] <= scalar * matrix[127:112];
			result[287:256] <= scalar * matrix[143:128];
			result[319:288] <= scalar * matrix[159:144];
			result[351:320] <= scalar * matrix[175:160];
			result[383:352] <= scalar * matrix[191:176];
			result[415:384] <= scalar * matrix[207:192];
			result[447:416] <= scalar * matrix[223:208];
			result[479:448] <= scalar * matrix[239:224];
			result[511:480] <= scalar * matrix[255:240];
		end
	end //always

endmodule 

