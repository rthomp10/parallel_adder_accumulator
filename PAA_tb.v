
//  representation of a 4x4 16bit matrix
//  [15:0]    [31:16]   [47:32]   [63:48]
//  [79:64]   [95:80]   [111:96]  [127:112] 
//  [143:128] [159:144] [175:160] [191:176]
//  [207:192] [223:208] [239:224] [255:240]

module tb_parallel_adder_accumulator;
// Inputs
reg [255:0] input1;  
reg [255:0] input2;
reg add_sub;
reg [1:0] select;
reg clk;

// Outputs
wire [511:0] result;
reg reset;

//Testbench specific variables
integer i;

parameter CLK_PERIOD = 10;

adder_subtractor uut(
	.dataa(input1), 
	.datab(input2),
	.in_select(select),
	.add_sub(add_sub),
	.clk(clk),
	.result(result),
	.reset(reset)
);
	

initial begin
	clk = 1'b0;
	add_sub = 1;
	reset = 0;
	#CLK_PERIOD;
 end


 always #( CLK_PERIOD ) begin
	
end  
 
 always #( CLK_PERIOD/2 )
	clk = ~clk;
      
endmodule