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


module Top_Level_tb;

	parameter n=4;

	// Inputs
	reg [n-1:0] a, b;
	reg c_in;
	reg[2:0] select;
	
	reg clk;

	// Outputs
	//wire c_out,out;
	//wire[n-1:0] sum;
	//wire c_out_verify;
	wire[n-1:0] sum_verify;
	wire error_flag;
	wire[n:0] solution, concoc_verify;


	// Instantiate the Unit Under Test (UUT)
	ToplevelMod  #(.n(n)) mod(.select(select),.a(a),.b(b),.c_in(c_in),.clk(clk),.final(solution));
	
	//nbit_ALU #(.n(n)) alutest(select, a,b, c_in, solution );
	
	//ALU1bit testing1bit(select, out, a1,b1,c_in,c_out);
	
	// Verification module
	ALU_behavioral  #(.WIDTH(n)) Verification(
  a,
  b,
  select,
  sum_verify);
  
	
	assign concoc_verify = {c_in,sum_verify};

	
	// Assign Error_flag
	assign error_flag = (concoc_verify != solution);
	
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
        a = 4'b0000; b = 4'b0001; c_in = 0;select = 3'b000; #10;
        a = 4'b1001; b = 4'b0000; c_in = 0;select = 3'b001; #10;
        a = 4'b0000; b = 4'b0001; c_in = 0;select = 3'b010; #10;
        a = 4'b0001; b = 4'b0010; c_in = 1;select = 3'b011; #10;
        a = 4'b0010; b = 4'b0001; c_in = 1;select = 3'b011; #10;
        a = 4'b0010; b = 4'b0001; c_in = 0;select = 3'b100; #10;
        a = 4'b0010; b = 4'b0001; c_in = 0;select = 3'b101; #10;




	end
	      
endmodule
