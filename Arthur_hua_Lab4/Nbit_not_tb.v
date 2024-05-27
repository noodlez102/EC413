`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//

// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_str
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Nbit_not_tb;

	// Inputs
	reg[3:0] a,b;
	parameter n =4;

	// Outputs
	wire[3:0] c_out;
	wire[4:0] sum;

	// Instantiate the Unit Under Test (UUT)
	param_mux  #(.n(n)) uut(.select(1), .a(a), .b(b), .out(c_out));
	assign sum = {c_out, 1'b1};
	initial begin
		// Initialize Inputs
		a = 4'b1001;b = 4'b0001;
		#100;
	end
      
endmodule

