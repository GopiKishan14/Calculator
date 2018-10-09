`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:10 10/07/2018 
// Design Name: 
// Module Name:    tb_alu 
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

module tb_alu;
//Inputs
 reg[3:0] A,B;
 reg[1:0] ALU_Op;

//Outputs wire 
wire [3:0] ALU_Out;

//Initialising Input Register
reg [9:0] mem[2:0];

 alu test_unit(
				.ALU_Out(ALU_Out), 	// ALU 4-bit Output
            .A(A),.B(B),  			// ALU 4-bit Inputs                 
            .ALU_Op(ALU_Op)		// ALU Selection           
     );
    initial begin
	 $readmemb("./input.txt" , mem);
	 
		ALU_Op = mem[0];
		A = mem[1];
		B = mem[2];
		#100
		     
      $finish;
    end 
 endmodule