`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    dff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module nbit_tb;

	parameter n = 16;
	// Inputs
	reg [n-1:0] d;
	reg clk;
	// Outputs
	wire [n-1:0] q;
	// Instantiate the Unit Under Test (UUT)
	nbitreg #(n) registerTest (
	.out(q), .in(d), .clk(clk));
	initial begin
		// Initialize Inputs
		d = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
	// Add stimulus here
	end
	always
	#5 clk = ~clk;
	always
	#20 d = d+1;

endmodule
