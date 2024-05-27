`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 06:25:10 PM
// Design Name: 
// Module Name: FA_str_tb2
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
//this is my testbench for the ripple carry adder and the carry select adder by changing it I can test both of them.

module FA_str_tb3;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;
	
	reg clk;

	// Outputs
	wire c_out;
	wire[63:0] sum;
	wire c_out_verify;
	wire[63:0] sum_verify;
	wire error_flag;


	// Instantiate the Unit Under Test (UUT)
	Carry_select_adder FA (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Verification module
	Verification_64bit Verification (
		.c_out(c_out_verify), 
		.sum(sum_verify), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);
	
	// Assign Error_flag
	assign error_flag = (c_out != c_out_verify || sum != sum_verify);
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error_flag)
			// Use $display here instead of $monitor
			// $monitor will display the message whenever there's a change of a, b, c_in
			// $display will only display once when it's been executed
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
	// Derfine clk signal for Verfication purpose
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		a = 64'h0;
		b = 64'h0;
		c_in = 1'd0;
		
		// Wait 150 ns
		#150;
		a = 64'hffffffffffffffff;
		b = 64'h0;
		c_in = 1'd1;
		


	end
	
	always #27  {a,b,c_in} ={a,b,c_in}+1;
      
endmodule
