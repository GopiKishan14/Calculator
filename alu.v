`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:16 10/07/2018 
// Design Name: 
// Module Name:    alu 
// Project Name: Calculator 
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
module alu(ALU_Out, A , B , ALU_Op);
				
			  output reg [3:0] ALU_Out;	// ALU 4-bit Output
           input [3:0] A,B;  // ALU 4-bit Inputs                 
           input [1:0] ALU_Op;// ALU Selection
            
    //Initialising Register and File_id
	 //reg [3:0] mem[1:0];
	 integer file_id;
    
    always @(*)
    begin
	 
			file_id = $fopen("./output.txt" , "w");
			
        case(ALU_Op)
		  
        2'b00: // Addition
			  begin 
				  ALU_Out = A + B; 
				  $display("Addition operation");
					$fwrite(file_id , "%04b" , ALU_Out);
			  end
           
        2'b01: // Subtraction
           begin 
					ALU_Out = A - B; 
					$display("Subtraction operation"); 
					$fwrite(file_id , "%04b" , ALU_Out);
			  end
			  
        2'b10: // OR Operation
			  begin 
					ALU_Out = A | B; 
					$display("OR operation"); 
					$fwrite(file_id , "%04b" , ALU_Out);
			  end
			  
        2'b11: // 2's complement
			  begin 
					ALU_Out = ~A + 4'b0001; 
					$display("2's complement operation"); 
					$fwrite(file_id , "%04b" , ALU_Out);
			  end          
			  default: ALU_Out = 4'bXXXX; 
        endcase
		  
		  $fclose(file_id);		  
    end	  
endmodule
