`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2024
// Design Name: 
// Module Name: ALU_TB
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

module ALU_TB();

    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Mode;
    reg clock; // Declare clock signal
    wire [7:0] Out;
    wire [3:0] Flags;

    ALU dut (
        .Operand1(A),
        .Operand2(B),
        .Mode(Mode),
        .Out(Out),
        .Flags(Flags) 
    ); // The Z (zero), C (carry), S (sign), O (overflow) bits, from MSB to LSB, connected to status register 

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        A = 8'h4; 
        B = 8'h2; 
        Mode = 4'b0000;
        #20 Mode = 4'b0001;
        #20 Mode = 4'b0010;
        #20 Mode = 4'b0011;
        #20 Mode = 4'b0100;
        #20 Mode = 4'b0101;
        #20 Mode = 4'b0110;
        #20 Mode = 4'b0111;
        #20 Mode = 4'b1000;
        #20 Mode = 4'b1001;
        #20 Mode = 4'b1010;
        #20 Mode = 4'b1011;
        #20 Mode = 4'b1100;
        #20 Mode = 4'b1101;
        #20 Mode = 4'b1110;
        #20 Mode = 4'b1111;
    end
    
endmodule