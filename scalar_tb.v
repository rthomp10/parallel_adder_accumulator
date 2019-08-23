

//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

module tb_scaly;
// Inputs
reg [15:0] input1;  
reg [255:0] input2;
reg clk;
reg [1:0] select;

// Outputs
wire [511:0] result;
reg reset;

//Testbench specific variables
integer i;

parameter CLK_PERIOD = 10;

scale_multiply scaly(
	.scalar(input1),
	.matrix(input2),
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
	for( i = 0; i < 16; i = i+1 ) begin
		input2[i*16 +: 16] = 0;
	end
	#CLK_PERIOD;
 end


 always #( CLK_PERIOD ) begin
	for( i = 0; i < 16; i = i+1 ) begin
		input1 <= input1 + 1;
		input2[i*16 +: 16] <= input2[i*16 +: 16] + 2;
	end
end  

 
 always #( CLK_PERIOD/2 )
	clk = ~clk;
      
endmodule