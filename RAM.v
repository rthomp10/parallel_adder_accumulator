
module RAM(
	input [511:0] data_in, 
	input [5:0] addr,
	input write_enable, 
	input clk,
	output [511:0] data_out
);

	reg [511:0] ram [0:63];
	reg [5:0] addr_reg; //holds the passed read address
	
	always @ (posedge clk) begin
		if (write_enable)
			ram[addr] <= data_in;
		addr_reg <= addr;
	end
	assign data_out = ram[addr_reg]; // The reason why addr_reg exists
	
endmodule
