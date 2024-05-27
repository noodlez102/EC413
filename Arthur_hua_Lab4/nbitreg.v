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

module nbitreg(in, out, clk);

	parameter n = 6;		

	input[n-1:0]	in;
	input 	clk; //declare inputs d and clk, 1 bit each
	output [n-1:0]	out;          //declare output q, 1 bit

	genvar i; 
	generate
	for(i=0; i<n;i=i+1)begin:registerblk
	dff DflipFlop(out[i], in[i], clk);
	end
	endgenerate


endmodule
