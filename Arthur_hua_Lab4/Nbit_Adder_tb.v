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

module Nbit_Adder_tb;
	parameter n = 4;
	// Inputs
	reg [n-1:0] in1, in2;
	reg c_in;
	// Outputs
	wire [n-1:0] out;
	wire c_out;
	// Instantiate the Unit Under Test (UUT)
	Nbit_Adder #(n) adderTest (
	.a(in1), .b(in2), .sum(out), .c_in(c_in), .c_out(c_out));
	initial begin
	//Initialize Inputs
	in1 = 0;
	in2 = 0;
	c_in= 0;
	// Wait 100 ns for global reset to finish #100;
	end
	always
	#2
	{c_in,in1,in2} = {c_in, in1, in2}+1;
endmodule
