
//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

module tb_transposy;
reg [255:0] input1; 
reg [1:0] select; 
reg clk;
wire [511:0] result;
reg reset;

//Testbench specific variables
integer i;

parameter CLK_PERIOD = 10;

transpose DUT(
	.dataa(input1),
	.clk(clk),
	.result(result),
	.reset(reset),
	.in_select(select)
);
	

initial begin
	clk = 1'b0;
	reset = 0;
	input1 = 0;
	select = 2'b01;
	#CLK_PERIOD;
 end 
 
 always #( CLK_PERIOD ) begin
	for( i = 0; i < 16; i = i+1 ) begin
		input1[i*16 +: 16] <= input1[i*16 +: 16] + i;
	end
 end

 
 always #( CLK_PERIOD/2 )
	clk = ~clk;
      
endmodule