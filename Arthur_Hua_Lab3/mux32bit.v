`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    FA_str 
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

//themux for the carry select adder
module mux32bit(select, a, b, carry);

input[31:0]		a, b;
input		select; //declare inputs a, b and c_in, 1 bit each
output[31:0]	carry; //declare outputs c_out and sum, 1 bit each

assign carry = select ? b:a;


endmodule