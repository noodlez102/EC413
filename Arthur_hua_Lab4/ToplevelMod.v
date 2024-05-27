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

module ToplevelMod(select,a,b,c_in,clk,final);
	parameter n=8;
	input [n-1:0] a, b;
	input c_in,clk;
	input[2:0] select;
	output [n:0] final;
	
/*	wire[n-1:0] sum;
	wire[n:0] concoc, concoc_not;
	wire c_out;
	wire [n-1:0]	notout; */
	wire [n:0]	intoReg;


//	Nbit_Adder  #(.n(n))	adding(.c_out(c_out), .a(a),.b(b),.sum(fsum),.c_in(c_in));
//	assign concoc = {fsum,c_out};
//	Nbit_not	#(.n(n)) notting(.in(a), .out(notout));
//	assign concoc_not = {notout,1'b1};
//	param_mux	#(.n(n+1))  choosing(.select(select), .a(concoc), .b(concoc_not), .out(intoReg));

	nbit_ALU #(.n(n)) doingALUstuff(.select(select), .r2(a),.r3(b), .c_in(c_in), .out(intoReg));	
	nbitreg	 #(.n(n+1)) regestering(.in(intoReg), .out(final),.clk(clk));
	assign final = intoReg;
endmodule
