//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]    
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

//  representation of a 4x4 32bit matrix
//  [31:0]    [63:32]   [95:64]   [127:96]   
//  [159:128] [191:160] [223:192] [255:124]
//  [287:256] [319:288] [351:320] [383:352]
//  [415:384] [447:416] [479:448] [511:480]

module multiply(
	input [255:0] dataa,
	input [255:0] datab,
	input clk,
	input [1:0] in_select,
	output reg [511:0] result,
	input reset
	);

	always @ ( posedge clk ) begin
		if( reset ) result = 0;
		else if( in_select == 2 ) begin
/*Row 1*/	result[31:0]    <= dataa[15:0] * datab[15:0]
							 + dataa[31:16]* datab[79:64]
							 + dataa[47:32]* datab[143:128]
							 + dataa[63:48]* datab[207:192];
			result[63:32]   <= dataa[15:0] * datab[31:16]
							 + dataa[31:16]* datab[95:80] 
							 + dataa[47:32]* datab[159:144]
							 + dataa[63:48]* datab[223:208];
			result[95:64]   <= dataa[15:0] * datab[47:32]
							 + dataa[31:16]* datab[111:96]   
							 + dataa[47:32]* datab[175:160]
							 + dataa[63:48]* datab[239:224];
			result[127:96]  <= dataa[15:0] * datab[63:48]
							 + dataa[31:16]* datab[127:112]   
							 + dataa[47:32]* datab[191:176]
							 + dataa[63:48]* datab[255:240];
/*Row 2*/	result[159:128] <= dataa[79:64]  * datab[15:0]
							 + dataa[95:80]  * datab[79:64]   
							 + dataa[111:96] * datab[143:128]
							 + dataa[127:112]* datab[207:192];
			result[191:160] <= dataa[79:64]  * datab[31:16]
							 + dataa[95:80]  * datab[95:80]   
							 + dataa[111:96] * datab[159:144]
							 + dataa[127:112]* datab[223:208];
			result[223:192] <= dataa[79:64]  * datab[47:32]
							 + dataa[95:80]  * datab[111:96]   
							 + dataa[111:96] * datab[175:160]
							 + dataa[127:112]* datab[239:224];
			result[255:124] <= dataa[79:64]  * datab[63:48]
							 + dataa[95:80]  * datab[127:112]   
							 + dataa[111:96] * datab[191:176]
							 + dataa[127:112]* datab[255:240];
/*Row 3*/	result[287:256] <= dataa[143:128] * datab[15:0]
							 + dataa[159:144] * datab[79:64]   
							 + dataa[175:160] * datab[143:128]
							 + dataa[191:176] * datab[207:192];
			result[319:288] <= dataa[143:128] * datab[31:16]
							 + dataa[159:144] * datab[95:80]   
							 + dataa[175:160] * datab[159:144]
							 + dataa[191:176] * datab[223:208];
			result[351:320] <= dataa[143:128] * datab[47:32]
							 + dataa[159:144] * datab[111:96]  
							 + dataa[175:160] * datab[175:160]
							 + dataa[191:176] * datab[239:224];
			result[383:352] <= dataa[143:128] * datab[63:48]
							 + dataa[159:144] * datab[127:112]   
							 + dataa[175:160] * datab[191:176]
							 + dataa[191:176] * datab[255:240];
/*Row 4*/	result[415:384] <= dataa[207:192] * datab[15:0]
							 + dataa[223:208] * datab[79:64]   
							 + dataa[239:224] * datab[143:128]
							 + dataa[255:240] * datab[207:192];
			result[447:416] <= dataa[207:192] * datab[31:16]
							 + dataa[223:208] * datab[95:80]   
							 + dataa[239:224] * datab[159:144]
							 + dataa[255:240] * datab[223:208];
			result[479:448] <= dataa[207:192] * datab[47:32]
							 + dataa[223:208] * datab[111:96]   
							 + dataa[239:224] * datab[175:160]
							 + dataa[255:240] * datab[239:224];
			result[511:480] <= dataa[207:192] * datab[63:48]
							 + dataa[223:208] * datab[127:112]   
							 + dataa[239:224] * datab[191:176]
							 + dataa[255:240] * datab[255:240];
		end
	end //always

endmodule 

