`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 06:36:52 PM
// Design Name: 
// Module Name: Verification_1bit2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//this is my carry select adder that works by doing the 32 bit in parallel to make it faster.
module Carry_select_adder(c_out, sum, a, b, c_in);

	input [63:0] a,b;
	input c_in;
	output c_out;
	output [63:0] sum;


	wire carry_out1, carry_out2, select;
	wire [31:0] sum1, sum2;

	wire c,d;

	FA32b FA1(.c_out(select), .sum(sum[31:0]), .a(a[31:0]), .b(b[31:0]), .c_in(c_in));
	FA32b FA2(.c_out(carry_out1), .sum(sum1[31:0]), .a(a[63:32]), .b(b[63:32]),.c_in(1'b0));
	FA32b FA3(.c_out(carry_out2), .sum(sum2[31:0]), .a(a[63:32]), .b(b[63:32]),.c_in(1'b1));
	mux32bit mux(.carry(sum[63:32]), .select(select),.a(sum1[31:0]),.b(sum2[31:0]));
	mux1bit mux2(.carry(c_out), .select(select),.a(carry_out1), .b(carry_out2)); 
	
endmodule